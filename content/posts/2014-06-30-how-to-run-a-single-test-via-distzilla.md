+++
author="oalders"
date=2014-06-30T04:10:37+00:00
title="How to Run a Single Test via Dist::Zilla"
type="post"
url="/2014/06/30/how-to-run-a-single-test-via-distzilla"
categories=[
  "cpan",
  "dist::zilla",
  "perl",
]
+++

Last week I was working on a distribution which includes some XS and
also uses Dist::Zilla. I needed to edit a single test, but didn\'t want
to run the entire test suite after every edit. It wasn\'t immediately
clear to me how to do this via \"dzil test\". I asked in #dzil and
within a couple of minutes I got some excellent advice in the form of:\
\
dzil run prove -lv t/my-test.t\
\
If there is no XS in your distribution you can skip the build process
and get an even faster test run:\
\
dzil run \--nobuild prove -lv t/my-test.t\
\
Many thanks to [KENTNL](https://metacpan.org/author/KENTNL) for the tip.

## Comments

Author: Caleb Cushing ( xenoterracide )

Date: 06/30/2014 01:48:09 PM

  unless this is affected by generated code (or it's generated) you could just run `prove -lv t/my-test.t` no need to run dzil at all. I suspect nobuild means dzil build phase doesn't run which means code generation doesn't happen, but I'm not sure.


---

Author: Olaf Alders

Date: 06/30/2014 03:07:45 PM

  In this case, `prove -lv t/my-test.t` failed with some errors related to the XS code.  So, running the tests via dzil was the easier option for me as that "just worked".  Having said that, yes, just running prove will probably be easier in a lot of cases as well, but it's nice to know that you have some options.


---

Author: Graham Knop

Date: 06/30/2014 07:39:42 PM

  If you are dealing with XS code, you'll need prove's -b option instead of -l


---

Author: Olaf Alders

Date: 06/30/2014 08:21:31 PM

  Thanks, -b doesn't seem to work for me.  FWIW, I'm working on <a href="https://github.com/maxmind/MaxMind-DB-Writer-perl" rel="nofollow">https://github.com/maxmind/MaxMind-DB-Writer-perl</a> and the error I get from prove directly is "~/MaxMind-DB-Writer-perl ∙ carton exec prove -lvb t/MaxMind/DB/Writer/Tree-record-collisions.t
t/MaxMind/DB/Writer/Tree-record-collisions.t .. MaxMind::DB::Writer::Tree object version 0.050004 does not match bootstrap parameter 42 at /opt/perl5.16.3/lib/5.16.3/x86_64-linux/DynaLoader.pm line 213."

I get that error with -l, -lb and -b.  It goes away with "dzil run", though.  This module is also already installed on the system I'm developing on.  Not sure if that's related.


---

Author: Ether

Date: 07/04/2014 01:51:19 AM

  There is a Build.PL in the repository for that dist, so you should be able to simply:  perl Build.PL && ./Build && ./Build test -- or just perl Build.PL && ./Build && perl -Mblib t/foo.t.

