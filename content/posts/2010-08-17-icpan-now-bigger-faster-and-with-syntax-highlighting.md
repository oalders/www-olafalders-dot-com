+++
author="oalders"
date=2010-08-17T04:37:50+00:00
title="iCPAN: Now Bigger, Faster and with Syntax Highlighting"
type="post"
url="/2010/08/17/icpan-now-bigger-faster-and-with-syntax-highlighting"
categories=[
  "cpan",
  "icpan",
  "ipad",
  "iphone",
  "ipod",
  "perl",
  "perldoc",
]
+++

Since we\'ve been porting CPAN to the iPhone via
[iCPAN](http://itunes.apple.com/us/app/icpan/id377340561?mt=8), we\'ve
had the chance to re-imagine the CPAN a little bit. We\'ve been
thinking, what would we change about
[search.cpan.org](http://search.cpan.org) if we were able? We\'ve added
the bookmarking, we save searches of recently viewed modules and now
we\'ve got syntax highlighting.\
\
A lot of us see our code highlighted in our editors. That\'s how we\'re
accustomed to viewing code. So why not view it that way in our module
documentation? (Now, we\'re fully aware that this can be done with
[GreaseMonkey](https://addons.mozilla.org/en-US/firefox/addon/748/), but
it would be nice to have this available for everyone without needing to
use a special extension). A great example is
[perldoc.perl.org](http://perldoc.perl.org), which does have syntax
highlighting, but it only (as far as I can tell) does so for core
modules.\
\
I\'m happy to say that as of today, if you download iCPAN to your iPhone
you can view the docs for over 61,000 modules with syntax highlighting.
We\'ve done so by using Alex Gorbatchev\'s excellent
[SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/). The
docs now take a little longer to render on my 1st generation iPhone, but
it\'s well worth the wait. They look great and are much more enjoyable
to read. Of course, the newer your phone is, the faster the docs will
render.\
\
**Faster Search**\
\
The biggest complaint about the first version of the app as that
searches were painfully slow. We released with a slow search because we
felt it was more important to release a slow app rather than no app at
all. As part of our iterative approach, we\'ve disabled the
\"search-as-you-type\" feature and it turns out that this greatly
improves the search speed. We hope to reintroduce the \"as-you-type\"
functionality once we\'ve got it working at a good speed.\
\
**More Modules**\
\
This latest release contains over 4,000 more modules than the previous
version. We\'ve still got more to include in the next version (such as
cookbook docs), but this is a big improvement as well.\
\
**Reporting Bugs**\
\
We\'ve gotten some really positive feedback since we first announced the
project and I\'ve opened issues for the bug reports folks have sent to
me. If you have issues or wishlist items, please feel free to [create
and tag your issues at GitHub](http://github.com/oalders/iCPAN/issues).

## Comments

Author: Ævar Arnfjörð Bjarmason

Date: 08/17/2010 07:54:53 AM

  The #1 thing you're doing right that search.cpan.org isn't: Open Source.


---

Author: Olaf Alders

Date: 08/17/2010 07:50:56 PM

  Thanks!  It really would be great if people could contribute back to the source code of search.cpan.org.  There's really a lot you could do with it and I'm sure a number of people would be interested.


---

Author: Marc

Date: 08/18/2010 06:48:35 AM

  Wow, I did not know about this app before your blog-post here at blogs.perl.org. Thats super great! It would be perfect if you could optimize the app also for the iPad since it looks a bit tiny on the big screen :) Thanks, Marc


---

Author: Olaf Alders

Date: 08/24/2010 03:47:28 AM

  Hi Marc,

iPad optimization is pretty much the next thing on this list.  It really does look horrible on that big screen.  :)

