---
title: "Making Dynamically Required Package Names More Discoverable in Perl"
type: post
author: oalders
date: 2022-03-30T07:18:11-05:00
url: "2022/03/30/making-dynamically-required-package-names-more-discoverable-in-perl"
categories:
  - perl
  - perlimports
description: "I’ve been using perlimports a lot at $work. I’m generally quite happy with it, but perlimports can get confused by modules which are being dynamically used. Let's look at an interesting strategy to fix this."
summary: "I’ve been using perlimports a lot at $work. I’m generally quite happy with it, but perlimports can get confused by modules which are being dynamically used. Let's look at an interesting strategy to fix this."
toc: false
thumbnail:
images: []
draft: false
---
I've been using [perlimports](https://metacpan.org/pod/perlimports) a lot at
$work. I'm generally quite happy with `perlimports`, but it can get confused by
modules which are being dynamically used. Consider the following case, where we
are using a function to create new objects.

We'll be using [Git::Helpers::CPAN](https://metacpan.org/pod/Git::Helpers::CPAN) to
look up the Git repository for a CPAN module (or distribution).

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/factory.pl" %}}
```

The `object_factory()` function takes two arguments. The first is a class name.
In order to keep things simple, the class name will always be
`Git::Helpers::CPAN`. The second argument is the name of a CPAN module to look
up. When we run the script, the output is:

```
$ perl factory.pl
https://github.com/oalders/open-this.git
```

We've now established that the script compiles and runs. Based on the output of
the script, we can confirm `Git::Helpers::CPAN` is being used.

Let's run `perlimports` on it. We will use the `--no-preserve-unused` flag,
which means that `perlimports` should delete `use` statements for modules which
appear to be unused. The `-i` flag indicates that we'd like to perform an in
place edit.

```bash {.myclass linenos=false}
$ perlimports --no-preserve-unused -i factory.pl
```

The result is:

```diff {.myclass linenos=false}
@@ -5,7 +5,6 @@ use warnings;
 use feature qw( say signatures );
 no warnings qw(experimental::signatures);

-use Git::Helpers::CPAN ();

 my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
 say $module->repository->{url};
```

What happened?

[perlimports](https://metacpan.org/pod/perlimports) didn't find a use of
`Git::Helpers::CPAN`, like `Git::Helpers::CPAN->new` or
`$Git::Helpers::CPAN::VERSION` in the code, so it assumed that
`Git::Helpers::CPAN` was not being used at all and helpfully removed the offending `use` statement. [perlimports](https://metacpan.org/pod/perlimports) isn't smart enough to
know that `$class` will at some point contain `Git::Helpers::CPAN`, so it comes
to the conclusion that the `Git::Helpers::CPAN` serves no purpose here.

In order to prevent this from happening, we can use a handy trick.

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/factory2.pl" %}}
```

Did you spot the change?

```diff {.myclass linenos=false}
-my $module = object_factory( 'Git::Helpers::CPAN', 'Open::This' );
+my $module = object_factory( Git::Helpers::CPAN::, 'Open::This' );
 ```

 Let's run [perlimports](https://metacpan.org/pod/perlimports) again. This time
 no lines are removed. The package name is now discoverable as far as
 `perlimports` is concerned. Problem solved.

# The Explanation

Please take my explanation for what it is: a bit of hand waving. I haven't
looked at the underlying code and I actually don't know where this behaviour is
documented, but when `perl` sees a bareword suffixed by `::` and a package by
this name has already been required, `perl` will assume this is a fully
qualified package name.

For example, this script, which uses the `::` suffix once on line 12 and
twice on line 15, compiles without errors:

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/one-two-three.pl" %}}
```

Let's see what happens after we remove one line.

```diff {.myclass linenos=false}
 use warnings;

 use Git::Helpers::CPAN ();
-use Open::This         ();
 ```

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/one-two-three-b.pl" %}}
```

We now get the following compilation error:

> Bareword "Open::This::" refers to nonexistent package

Since there's no longer a `use` or `require` of `Open::This`, the instantiation of `$three` triggers the compilation error.

`Open::This` is indeed a package which does exist and is locally installed, but
since we haven't included it before this point, the script will exit with an
error.

The script includes a `use Git::Helpers::CPAN`, so there are no compilation
errors about the two uses of `Git::Helpers::CPAN::->new()`.

The main takeaway here is that if you're going to use a class name as a
bareword with the `::` suffix, you'll need to `use` or `require` that class
first.

# Other Uses

Maybe there are other interesting ways to use this. How about Moose attribute
definitions? Consider the following code:

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/antler.pl" %}}
```

This script compiles and runs without errors. Why?

The `some_date()` accessor is lazy and we haven't tried to access it yet. That
means that the anonymous subroutine (`DateTime->now`) which was provided as an
arg to `default` never gets run and our script runs in blissful ignorance of
the weak point in the logic. Hopefully we don't try to run `do_something()` later
on in our code. If we do, we'll get the following compilation error:

> Can't locate object method "now" via package "DateTime" (perhaps you forgot to load "DateTime"?)

Let's switch the `isa` to use a bareword with the `::` suffix on line 7.

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/antler-2.pl" %}}
```

If we try to run this script, we'll now get the following compile-time error:

> Bareword "DateTime::" refers to nonexistent package

We now have a safety check in place. In order to get this script to compile we
need to add the missing `use` statement.

```diff {.myclass linenos=false}
+use DateTime ();
+
 has some_date => (
     is      => 'ro',
     isa     => DateTime::,
```

That gives us the following working script:

```perl {.myclass linenos=inline}
{{% include "./examples/2022-03-30/antler-3.pl" %}}
```

This is one of the more useful cases I've come across for using the `::` suffix.

# Verbosity

`'My::Module'` takes up the same amount of characters as `My::Module::`,
so this syntax doesn't actually make your code any more verbose.
Deciding whether it makes your code more or less readable is left as an
exercise for the reader.

# Nota bene

Please note that while this is a handy trick to have up your sleeve, it could confuse colleagues who are not familiar with this behaviour. If you do introduce it, you may first want to give people a quick primer on what's going on here.

# Supported Perl Versions

I don't know when this functionality was introduced, but it works on a Perl `v5.8.9`. If you'd like to try it yourself, you can get the env up and running quickly via

```bash {.myclass linenos=false}
$ docker run -it perldocker/perl-tester:5.8 /bin/bash
```

Have fun with it!

