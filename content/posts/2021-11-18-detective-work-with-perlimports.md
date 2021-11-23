---
title: Detective Work with perlimports
author: oalders
type: post
date: 2021-11-18T00:00:00+00:00
url: /2021/11/18/detective-work-with-perlimports
categories:
  - Perl
  - Programming
  - perlimports

---
Today I was working on a test which uses [Test::WWW::Mechanize](https://metacpan.org/pod/Test::WWW::Mechanize). I was looking at the source of the `text_contains` method, which currently looks like:


```perl
sub text_contains {
    my $self = shift;
    my $str  = shift;
    my $desc = shift || qq{Text contains "$str"};

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    if ( ref($str) ) {
        return $TB->ok( 0, 'Test::WWW::Mechanize->text_contains called incorrectly.  It requires a scalar, not a reference.' );
    }

    return contains_string( $self->text, $str, $desc );
}
```

I was interested in the `return` value, so I grepped the file for `sub contains_string`. That search came up empty. I then had a very quick look at the module imports and I didn't see any reference to `contains_string` there either. As a next step, I thought it would be fun to use [perlimports](https://metacpan.org/pod/perlimports) to solve the problem for me.

```bash
git clone git@github.com:petdance/test-www-mechanize.git
cd test-www-mechanize
cpm install -g --cpanfile cpanfile
perlimports -f Mechanize.pm -i
git diff
```
Note that I used [cpm](https://metacpan.org/pod/App::cpm) to ensure that all of the modules prerequisites were installed locally. `perlimports` needs them installed in order to inspect them for possible exports.

The output of the diff is:

```diff
diff --git a/Mechanize.pm b/Mechanize.pm
index 8c57431..04c7191 100644
--- a/Mechanize.pm
+++ b/Mechanize.pm
@@ -66,10 +66,22 @@ results in

 use HTML::TokeParser ();
 use WWW::Mechanize ();
-use Test::LongString;
+use Test::LongString qw(
+    contains_string
+    is_string
+    lacks_string
+    like_string
+    unlike_string
+);
 use Test::Builder ();
 use Carp ();
-use Carp::Assert::More;
+use Carp::Assert::More qw(
+    assert_arrayref
+    assert_in
+    assert_is
+    assert_isa
+    assert_nonblank
+);

 use parent 'WWW::Mechanize';
```

There we go! [https://metacpan.org/pod/Test::LongString](Test::LongString) exports `contains_string`.

Doing this the old fashioned way would have involved

* grepping the code for modules with implicit imports. A good starting place would have been the `use` statements at the top of the file.

 ```
use HTML::TokeParser ();
use WWW::Mechanize ();
use Test::LongString;
use Test::Builder ();
use Carp ();
use Carp::Assert::More;
```

* There I would have seen that `Test::LongString` and `Carp::Assert::More` don't have any parens, so they might import some symbols.
* I would have checked the documentation of these modules until I found what I was looking for.

In this case there's not a huge amount of overhead in doing this manually, but if you're in a hurry, you may miss that `Test::LongString` allows for an implicit import. Using `perlimports` takes some of the eyeball work out of the equation.

As a bonus, I can take the diff and submit it as [a pull request](https://github.com/petdance/test-www-mechanize/pull/76/). (The following example uses [gh](https://github.com/cli/cli) to manage the interactions with GitHub).

```
gh repo fork
git add -p
git commit -m "Make implicit imports explicit"
git push origin
gh pr create
```

Thanks to [Andy Lester](https://metacpan.org/author/PETDANCE) for the lightning fast merge on the pull request. 🚀

Edit: After this post was first published, [Matt Trout](https://metacpan.org/author/MSTROUT) pointed out that he had written [Devel::Wherefore](https://metacpan.org/pod/Devel::Wherefore) to solve this same problem. It won't rewrite your code for you, but it's good to have options!
