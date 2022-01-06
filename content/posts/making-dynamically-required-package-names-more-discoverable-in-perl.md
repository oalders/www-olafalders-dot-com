---
title: "Making Dynamically Required Package Names More Discoverable in Perl"
type: post
author: oalders
date: 2021-12-08T09:18:11-05:00
url: "2021/12/08/making-dynamically-required-package-names-more-discoverable-in-perl"
categories:
  -
tags:
  -
description: "add description"
toc: false
thumbnail:
images: []
draft: true
---
I've been using [perlimports](https://metacpan.org/pod/perlimports) a lot at
$work. I'm generally quite happy with it, but it can get confused by modules
which are being dynamically used. Consider the following case, where we are
using a function to create new objects.

The `object_factory` function takes two arguments. One is a class name (which
will always be `Git::Helpers::CPAN` in our case) and the second is the name of
a CPAN module to look up. Yes, the class name will always be the same, so what
we have is not a compelling example for this object factory pattern, but it
illustrates that you can call a class method on a variable.

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say signatures );
no warnings qw( experimental::signatures );

use Git::Helpers::CPAN ();

sub object_factory ( $class, $name ) {
    return $class->new( name => $name );
}

my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
say $module->repository->{url};
```

For background,
[Git::Helpers::CPAN](https://metacpan.org/pod/Git::Helpers::CPAN) is a module
which tries to look up the Git repository for a CPAN module (or distribution).
If I run the script, the output is:

```
$ perl factory.pl
https://github.com/oalders/open-this.git
```

The script works and we know that `Git::Helpers::CPAN` is being used. Let's try
to run `perlimports` on it:

```bash
perlimports --no-preserve-unused -i factory.pl
```

The result is:

```diff
@@ -5,7 +5,6 @@ use warnings;
 use feature qw( say signatures );
 no warnings qw(experimental::signatures);

-use Git::Helpers::CPAN ();

 my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
 say $module->repository->{url};
```

What happened?

With the above invocation, if
[perlimports](https://metacpan.org/pod/perlimports) doesn't find a use of
`Git::Helpers::CPAN`, like `Git::Helpers::CPAN->new` or
`$Git::Helpers::CPAN::VERSION` in the code, it will assume that
`Git::Helpers::CPAN` is not being used at all and it will be inclined to remove
it. [perlimports](https://metacpan.org/pod/perlimports) isn't smart enough to
know that `$class` will at some point contain `Git::Helpers::CPAN`, so it comes
to the conclusion that the `Git::Helpers::CPAN` serves no purpose here.

In order to prevent this from happening, we can use a handy trick. Can you spot the change to the code?

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say signatures );
no warnings qw( experimental::signatures );

use Git::Helpers::CPAN ();

sub object_factory ( $class, $name ) {
    return $class->new( name => $name );
}

my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
say $module->repository->{url};
```

Did you see it?

```diff
-my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
+my $module = object_factory( Git::Helpers::CPAN::, 'Open::This' );
 ```

 When running [perlimports](https://metacpan.org/pod/perlimports) again, no
 lines are removed. The package name is discoverable. Problem solved.

# The Explanation

Please take my explanation for what it is: a bit of hand waving. I haven't
looked at the underlying code and I actually don't know where this behaviour is
documented, but when `perl` sees a bareword suffixed by `::` and a package by
this name has already been required, `perl` will assume this is a fully
qualified package name.

For example, this script compiles without errors:

```perl
#!/usr/bin/env perl

use strict;
use warnings;

use Git::Helpers::CPAN ();
use Open::This         ();

my $one   = Git::Helpers::CPAN->new( name => 'Open::This' );
my $two   = Git::Helpers::CPAN::->new( name => 'Open::This' );
my $three = Git::Helpers::CPAN::->new( name => Open::This:: );
```

Let's see what happens after we remove one line.

```diff
 use warnings;

 use Git::Helpers::CPAN ();
-use Open::This         ();

 my $one   = Git::Helpers::CPAN->new( name => 'Open::This' );
 my $two   = Git::Helpers::CPAN::->new( name => 'Open::This' );
 ```

```sh
Bareword "Open::This::" refers to nonexistent package at one-two-three-b.pl line 10.
```

Since there's no longer a previous call to `Open::This`, the 3rd instantiation
of `$module` triggers the error. The script in its current state:

```perl
#!/usr/bin/env perl

use strict;
use warnings;

use Git::Helpers::CPAN ();

my $one   = Git::Helpers::CPAN->new( name => 'Open::This' );
my $two   = Git::Helpers::CPAN::->new( name => 'Open::This' );
my $three = Git::Helpers::CPAN::->new( name => Open::This:: );
```

`Open::This` is indeed a package which does exist and is locally installed, but since we haven't included it before this point, the script will end with an error.

# Other Uses

Maybe there are other interesting ways to use this. How about Moose attribute
definitions? Consider the following code:

```perl
package Local::Antler;

use Moose;

has some_date => (
    is      => 'ro',
    isa     => 'DateTime',
    lazy    => 1,
    default => sub { DateTime->now },
);

__PACKAGE__->meta->make_immutable;
1;

package main;

sub do_something {
    my $a = Local::Antler->new;
    print $a->some_date;
}
```

This script compiles and runs without errors. Since `some_date` is lazy and we haven't tried to access it yet, the `default` never gets run and our script runs in blissful ignorance of the weak point in the logic. Hopefully we don't try to run `do_something` later on in our code. If we do, we'll get

```
Can't locate object method "now" via package "DateTime" (perhaps you forgot to load "DateTime"?)
```

Let's switch the `isa` to use a bareword with the `::` suffix.

```diff
 has some_date => (
     is      => 'ro',
-    isa     => 'DateTime',
+    isa     => DateTime::,
     lazy    => 1,
     default => sub { DateTime->now },
 );
 ```

 That gives us:


```perl
package Local::Antler;

use Moose;

has some_date => (
    is      => 'ro',
    isa     => DateTime::,
    lazy    => 1,
    default => sub { DateTime->now },
);

__PACKAGE__->meta->make_immutable;
1;

package main;

sub do_something {
    my $a = Local::Antler->new;
    print $a->some_date;
}
```

If we try to run this script, we'll now get the following compile-time error:

```
Bareword "DateTime::" refers to nonexistent package at moo.pl line 7.
```

We now have a safety check in place and in order to get this script to compile
we just need to add the missing `use` statement.

```diff
+use DateTime ();
+
 has some_date => (
     is      => 'ro',
     isa     => DateTime::,
```

That gives us the following working script:

```perl
package Local::Antler;

use Moose;

use DateTime ();

has some_date => (
    is      => 'ro',
    isa     => DateTime::,
    lazy    => 1,
    default => sub { DateTime->now },
);

__PACKAGE__->meta->make_immutable;
1;

package main;

sub do_something {
    my $a = Local::Antler->new;
    print $a->some_date;
}
```

`'My::Module'` takes up the same amount of characters as `My::Module::`, so
this syntax doesn't actually make your code any more verbose. Whether it makes
your code more or less readable, is left as an argument for someone else to
make.

# Nota bene

Please note that while this is a handy trick to have up your sleeve, it could confuse colleagues who are not familiar with this behaviour. If you do introduce it, you may want to give people a quick primer on what's going on here.

# Versions

I don't know when this functionality was introduced, but it works on a Perl `v5.8.9` which I fired up via `docker run -it perldocker/perl-tester:5.8 /bin/bash`.
