+++
author="oalders"
date=2010-11-02T03:36:02+00:00
title="Using Plack to Like a Module on Facebook"
type="post"
url="/2010/11/02/using-plack-to-like-a-module-on-facebook"
categories=[
  "cpan",
  "dependents",
  "facebook",
  "html::highlighter",
  "like",
  "perl",
  "plack",
]
+++

We\'ve made a couple of fun changes to
[cpan-mangler](http://github.com/oalders/cpan-mangler). First off, you
can now \"like\" modules on Facebook:\
\
[![mangler-facebook.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-thumb-600x141-342.png){.mt-image-center
width="600" height="141"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-342.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-342.html','popup','width=989,height=233,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
Now, up and downvoting of modules would be a lot more useful, but this
can be fun (and confusing for your friends):\
\
[![mangler-facebook-like.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-like-thumb-600x109-345.png){.mt-image-center
width="600" height="109"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-like-345.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-facebook-like-345.html','popup','width=566,height=103,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
Secondly, [Lee Aylward](http://github.com/leedo) added support for
HTML::Highlighter:\
\
[![mangler-highlighter.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-highlighter-thumb-600x251-348.png){.mt-image-center
width="600" height="251"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-highlighter-348.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-highlighter-348.html','popup','width=605,height=254,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
Thirdly, we\'ve added a tweaked version of [Jesse Thompson\'s CPAN
Dependents Greasemonkey
script](http://blogs.perl.org/users/jesse_thompson/2010/08/cpan-search-dependents.html).\
\
[![mangler-search.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-search-thumb-600x424-351.png){.mt-image-center
width="600" height="424"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-search-351.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/11/mangler-search-351.html','popup','width=977,height=692,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
If you\'ve already got cpan-mangler installed, a \"git pull\" should get
you going (you\'ll likely need to install some additional modules). If
you haven\'t, [you can clone the
repo](http://github.com/oalders/cpan-mangler#readme) and get yourself
started in just a couple of minutes. Have fun with it!

## Comments

Author: john napiorkowski

Date: 11/03/2010 12:05:42 AM

  Very cool, some of this stuff should probably be built in to the core cpan search stuff, but its great to see those features added in this creative way.

Good for Perl advocacy as well!

Thanks!
John


---

Author: Olaf Alders

Date: 11/03/2010 06:14:31 PM

  Thanks, John!  It really would be nice to see some changes in the core CPAN search.  This was really just a fun way to mess with Plack, but I actually do use it as my default search tool for CPAN now.  


As far as search goes, Toronto.pm is in the very early stages of putting an open CPAN search API together.


<a href="https://github.com/CPAN-API/cpan-api/wiki" rel="nofollow">https://github.com/CPAN-API/cpan-api/wiki</a>


We just started this past weekend (no code in the repo yet), but we should have a useful proof of concept online shortly.


---

Author: http://oid.fox.geek.nz/kent.fredric

Date: 11/19/2010 03:16:35 AM

  Would love it if somebody eventually put up this hacked-cpan-interface up on the WWW so we can all use it without needing to host our own =)

