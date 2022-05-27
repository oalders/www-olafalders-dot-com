+++
author="oalders"
date=2010-10-01T07:50:20+00:00
title="Mangling CPAN with Plack::App::Proxy"
type="post"
url="/2010/10/01/mangling-cpan-with-plackappproxy"
categories=[
  "cpan",
  "perl",
  "plack",
  "proxy",
  "syntax highlighting",
]
+++

If you want syntax highlighting when viewing docs **and** source at
[search.cpan.org](http://search.cpan.org), you don\'t actually need to
use Greasemonkey. You can do it with Plack and be up and running in just
a few minutes.\
\
Last night I gave a lightning talk about this at Toronto.pm and I\'ve
just [posted the slides](http://www.slideshare.net/oalders/mangling)\
\
Basically, all you need to do is this:\
\
\-\--\
git clone http://github.com/ioncache/Plack-Middleware-HTMLify.git\
git clone http://github.com/oalders/cpan-mangler.git\
\
cpanm Plack Plack::App::Proxy Plack::Handler::Twiggy\
\
cd cpan-mangler\
plackup -I../Plack-Middleware-HTMLify/lib\
\-\--\
\
Once you\'ve got that done, just point your browser at
http://localhost:5000 and use search.cpan.org as you normally would.
It\'s the same site, only prettier. Now, it\'s not perfect, but it\'s a
fun idea. Using the proxy setup you can bend the site to your will and
add or remove features as you see fit.\
\
[![cpan-pod-after.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-pod-after-thumb-600x433-319.png){.mt-image-center
width="600" height="433"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-pod-after-319.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-pod-after-319.html','popup','width=1119,height=809,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
[![cpan-source-after.png](http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-source-after-thumb-600x433-320.png){.mt-image-center
width="600" height="433"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-source-after-320.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2010/10/cpan-source-after-320.html','popup','width=1119,height=809,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
On a related note, Plack::App::Proxy is a great tool for running
multiple ad campaigns using the same web site. Imagine a client wants to
set up X ad campaigns using Google ads. They want to use the same site,
but they want each version of the site to have different phone numbers
in the content as well as custom analytics code in the source. Using
Plack::App::Proxy you don\'t have to know (or care) how the underlying
site works.\
\
Just set up a X proxies running under X domain names. Each proxy points
back at the original site, but substitutes the phone numbers and the
analytics code with something unique to that proxy. Now your ad
campaigns all point at what is essentially the same site, but you can
track your traffic and your telephone contacts on a per-site basis. The
dynamic parts of the site should continue to work as expected and you
haven\'t had to re-implement the original site.

## Comments

Author: oylenshpeegul

Date: 10/02/2010 01:46:26 AM

  Nice! I also had to add

<pre>
  cpanm Plack::Handler::Twiggy
</pre>

to get it to work.


---

Author: Olaf Alders

Date: 10/02/2010 02:34:29 AM

  Thanks!  I've added Plack::Handler::Twiggy to the article and the README now.

