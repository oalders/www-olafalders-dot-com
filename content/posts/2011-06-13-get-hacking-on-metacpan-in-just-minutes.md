+++
author="oalders"
date=2011-06-13T06:26:11+00:00
title="Get Hacking on MetaCPAN in Just Minutes"
type="post"
url="/2011/06/13/get-hacking-on-metacpan-in-just-minutes"
categories=[
  "cpan",
  "metacpan",
]
+++

One of the fun things about [MetaCPAN](http://beta.metacpan.org) is that
we\'ve split the project into two main parts: an
[API](https://github.com/CPAN-API/cpan-api) and [a front
end](https://github.com/CPAN-API/metacpan-web). What this means is that
if you want to start pushing your code into <http://beta.metacpan.org>,
you don\'t need to run a local copy of the API. You can just git clone
the front end, install your dependencies and be on your way.\
\
Install [cpanminus](http://beta.metacpan.org/module/App::cpanminus) if
you don\'t already have it. Then:\
\

    git clone git://github.com/CPAN-API/metacpan-web.git
    cd metacpan-web
    cpanm Dist::Zilla
    dzil listdeps | cpanm
    twiggy lib/MetaCPAN/Web.pm -p 5001 -R lib -R templates -E development

\
\
\
That\'s it! Now point your web browser at http://localhost:5001 and
you\'re in business. If you want to start pushing your commits into the
project, you\'ll naturally want to fork the project as well, but
there\'s no reason you have to fork it in order to test drive it.\
\
So, if you have 10 or 15 free minutes today, download the code and run
your own local copy. Test it out, bend it to your will and let us know
what you think.\
\
You can find us at #metacpan on irc.perl.org,
<http://twitter.com/metacpan> and
<https://groups.google.com/group/cpan-api>
