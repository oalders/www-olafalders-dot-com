---
title: Creating a Twitter List of CPAN Authors
author: oalders
type: post
date: 2019-05-23T17:40:30+00:00
url: /2019/05/23/creating-a-twitter-list-of-cpan-authors
categories:
  - MetaCPAN
  - Perl
  - Programming

---
Recently I found a great little [Twitter command line tool][1] called `t`. It does a lot of useful things, including building and editing Twitter lists. For example, with the following commands we can:

  * create a Twitter list called "my-list-of-people"
  * add the [@metacpan][2] account to the list
  * display the accounts which are now in the list we've just created

```bash
t list create my-list-of-people
t list add my-list-of-people @metacpan
t list members my-list-of-people</code></pre>
```

I thought it would be fun to create a Twitter list of CPAN authors using some of the data in the MetaCPAN API. Authors can [update their profiles on MetaCPAN][3] to add one or more Twitter accounts. This data can then be found in the `author` type of the MetaCPAN API, in the `profile` key. To find out how many Twitter usernames of CPAN authors we can get, we'll create a script that looks something like this:

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

use MetaCPAN::Client;

my $mc = MetaCPAN::Client-&gt;new( version =&gt; &#039;v1&#039; );

# Search for authors with a listed Twitter account
my $search = $mc-&gt;author( { &#039;profile.name&#039; =&gt; &#039;twitter&#039; } );

my @handles;
while ( my $author = $search-&gt;next ) {

    # grep matching author profiles to extract only the Twitter id
    my @profiles = grep { $_-&gt;{name} eq &#039;twitter&#039; } @{ $author-&gt;profile };

    foreach my $profile (@profiles) {
        my $id = $profile-&gt;{id};

        # not every handle returned by the API is prefixed by "@", so
        # we&#039;ll add it when it&#039;s missing
        $id = &#039;@&#039; . $id unless $id =~ m{\A@};
        push @handles, $id;
    }
}

# print a case-insensitive alpha-sorted list for humans to enjoy
say $_ for sort { "\L$a" cmp "\L$b" } @handles;</code></pre>
```

At this point you should be able to run this script, which prints the Twitter account names we are looking for. Now comes the Twitter integration. We could do this with a Perl module, but the point of this exercise is to use `t`.

The first thing you need to do is install [t, the Twitter command line tool][1]. Twitter OAuth is a bit cumbersome, so you'll also need to create your own OAuth app. The client will guide you through this process. If you run into any problems getting started once you've entered your OAuth keys, check [issue #402][4] and specifically [this comment][5].

Now all that's left is to create a list, run the script and pipe the output of the script to the new list.

```bash
$ t list create cpan-authors
$ perl twitter.pl | xargs t list add cpan-authors
$ t list cpan-authors members
```

That's it. Your list has now been created and you can curate it to your heart's content. As part of this exercise, I created an authors list for [my own Twitter account][6]. You can [see my cpan-authors list in action][7].

 [1]: https://github.com/sferik/t
 [2]: https://twitter.com/metacpan
 [3]: https://metacpan.org/account/profile
 [4]: https://github.com/sferik/t/issues/402
 [5]: https://github.com/sferik/t/issues/402#issuecomment-466909077
 [6]: https://twitter.com/olafalders
 [7]: https://twitter.com/olafalders/lists/cpan-authors
