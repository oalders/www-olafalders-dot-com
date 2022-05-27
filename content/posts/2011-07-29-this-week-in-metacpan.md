+++
author="oalders"
date=2011-07-29T04:52:07+00:00
title="This Week in MetaCPAN"
type="post"
url="/2011/07/29/this-week-in-metacpan"
categories=[
  "cpan",
  "github",
  "metacpan",
  "perl",
]
+++

Last week I posted an article on [how CPAN authors could expand their
profiles on
metacpan.org](http://blogs.perl.org/users/olaf_alders/2011/07/how-to-expand-your-metacpan-profile.html).
Since then there has been so much activity that I thought a quick recap
would be in order. I\'m not covering all activity, so my apologies to
anyone whose efforts have not been replayed here.\
\
At the time of the article, 91 authors had logged in to MetaCPAN and
updated their profiles. That number after one week is 240. That\'s still
a very small fraction of total CPAN authors, but it\'s also an amazing
start.\
\
On or just after the day of my post,
[Mo](https://metacpan.org/author/PERLER) added +1 to
[metacpan.org](http://metacpan.org). So, if you haven\'t already, log
yourself in and start upvoting your favourite distributions. There will
be more info on +1 to come, but this is a first step in making CPAN a
friendlier place.\
\
2 days after my post (July 22), [Johannes
Plunien](https://metacpan.org/author/plu)
[announced](http://www.pqpq.de/2011/07/github-meets-cpan.html)
[github-meets-metacpan.com](http://www.github-meets-cpan.com/), which is
a leaderboard of CPAN authors who are active on Github. It\'s a perfect
example of how the MetaCPAN API can be used for fun and interesting
mashups. My suspicion is that a good number of authors who have updated
their info in the last week have done so specifically so that they would
appear on github-meets-metacpan. It\'s a fun way to see where you
\"rank\" according to other authors and it may well encourage more Perl
activity on Github (and CPAN). I think it\'s great! (At the time of this
writing the number of authors on the leaderboard is up to 180).\
\
On the same day [tokuhirom](https://metacpan.org/author/TOKUHIROM)
announced [explorer.metacpan.org](http://explorer.metacpan.org/). This
is another incredibly useful (and fun) app. The MetaCPAN explorer makes
it easy for you to get started using the MetaCPAN API with basic PUT and
more complex POST requests. I see this app eventually replacing much of
the [API documentation in the
wiki](https://github.com/CPAN-API/cpan-api/wiki/Beta-API-docs). It\'s
kind of like a [jsfiddle](http://jsfiddle.net/) for the MetaCPAN. It
makes it easy to test and share queries. I\'ve used it myself and I have
to say that it\'s much much easier than putting together POST queries
via curl at the command line.\
\
On this same day, [sartak](https://metacpan.org/author/SARTAK) showed
[how easy it can
be](http://twitter.com/#!/sartak/status/94489316742529024) to add new
services to the MetaCPAN profile pages. You can do it in just a couple
of minutes.\
\
On the following day (July 23),
[miyagawa](https://metacpan.org/author/MIYAGAWA) tweeted that [the next
release of cpanmninus will include
MetaCPAN](http://twitter.com/#!/miyagawa/status/94871581205082112). [The
pull request in
question](https://github.com/miyagawa/cpanminus/pull/109) was provided
by the prolific [tokuhirom](https://metacpan.org/author/TOKUHIROM).\
\
Around this time, [Torsten Raudsuss](https://metacpan.org/author/GETTY)
set up a [MetaCPAN facebook page](https://www.facebook.com/metacpan).
Please feel free to \"like\" us so that you can be updated on the latest
developments and easily let fellow Perl devs on facebook know about
MetaCPAN.\
\
On July 24, [tokuhirom announced that he has submitted a MetaCPAN talk
to
YAPC::Asia](http://twitter.com/#!/tokuhirom/status/95310352039952384).
Excellent!\
\
On this same day [Sawyer X](https://metacpan.org/author/XSAWYERX)
released a new version of
[MetaCPAN::API](https://metacpan.org/release/MetaCPAN-API), which takes
advantage of the latest version (v0) of the API. MetaCPAN::API makes it
trivial to get started using MetaCPAN. I highly recommend it.\
\
On July 25 [Gabor Szabo published a MetaCPAN
screencast](http://szabgab.com/blog/2011/07/metacpan-is-awesome.html) to
introduce the site and some of its features. This was unexpected but
very welcome. The screencast now also has subtitles in both English and
Russian. The code is [available on
Github](https://github.com/szabgab/screencasts) for anyone who\'d like
to provide additional translations.\
\
On the same day [Johannes Plunien](https://metacpan.org/author/plu)
added more Github info to MetaCPAN. Now, if you hover over a Github
\"repository\" link on a distribution page, info about the Github repo
will be shown in a popup. Test it out on the
[Pithub](https://metacpan.org/release/Pithub) page. Incredibly useful.\
\
On July 26 [MetaCPAN
Growler](https://github.com/hideo55/metacpan-growler) was released by
[Hideaki Ohno](https://metacpan.org/author/HIDEAKIO). It \"fetches
MetaCPAN recent update modules and growls as new activies are coming
in\". This is particularly cool since MetaCPAN updates new releases in
something closely resembling real time.\
\
Today (July 28) [Tim Bunce](https://metacpan.org/author/TIMB) used his
[Devel-NYTProf](https://metacpan.org/release/Devel-NYTProf) to [double
the
performance](http://twitter.com/#!/timbunce/status/96527958533091328) of
the MetaCPAN indexer. As the indexer takes days to run, this is a huge
boost.\
\
Not every week is this fruitful, but more and more people are getting
involved and things are happening quickly. I\'d encourage you to stop by
#metacpan on irc.perl.org or follow
[\@metacpan](http://twitter.com/metacpan) on Twitter to stay on top of
all of the latest happenings.

## Comments

Author: Sawyer X

Date: 07/29/2011 10:17:35 AM

  Would have been nice to add a note about MetaCPAN::API which now supports the new beta API, plus the complex GET searches, and will very soon support arbitrary JSON searches, POST searches and predefined POST searches, covering all MetaCPANExplorer does, and more.

I intend to write a post about it today.


---

Author: Olaf Alders

Date: 07/29/2011 03:22:14 PM

  Of course, that was a big miss on my part. I've now updated the post.  Thanks for pointing that out!


---

Author: pavel.shaydo.com

Date: 07/29/2011 03:38:28 PM

  <p>I liked MetaCPAN Growler idea, but as it doesn't work on Linux I had to write my own for Gtk2: <a href="https://github.com/trinitum/perl-App-MetaCPAN-Gtk2-Notify"><a href="https://github.com/trinitum/perl-App-MetaCPAN-Gtk2-Notify">https://github.com/trinitum/perl-App-MetaCPAN-Gtk2-Notify</a></a></p>


---

Author: Olaf Alders

Date: 07/29/2011 03:48:39 PM

  Awesome. :) Thank you!

