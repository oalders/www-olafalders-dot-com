+++
author="oalders"
date=2012-05-24T06:19:59+00:00
title="iCPAN 2.0.0 now Available in the App Store"
type="post"
url="/2012/05/24/icpan-200-now-available-in-the-app-store"
categories=[
  "cpan",
  "iCPAN",
  "iOS",
  "metacpan",
  "objective-c",
  "perl",
]
+++

I\'m happy to announce that [iCPAN](https://github.com/oalders/iCPAN)
2.0.0 is now in [the app
store](http://itunes.apple.com/us/app/icpan/id377340561?mt=8). If
you\'re not familiar with it, iCPAN is a free iOS app which allows you
to browse CPAN Pod on your iPhone/iPod/iPad. The previous version of
iCPAN was released in November of 2010, so this has been a long time in
coming.\
\
If only CPAN had a web service\...\
\
Originally, my hope was to release frequent iCPAN updates with new Pod,
bug fixes and improvements. However, I was running into a lot of
problems with getting good coverage of CPAN modules. There was (not yet)
a web service which you could query to find out what is currently
indexed in CPAN or where you can find all the Pod in an arbitrary
distribution. I had been rolling my own solution with the help of some
CPAN modules, but my coverage was only around 60,000 documents, which
was poor. After discussing this with some friends at PerlMongers in
Toronto, I started hacking on an API to provide the Pod as well as some
metadata. The API soon had a name: [MetaCPAN](http://metacpan.org).
Working on MetaCPAN was so much fun and so productive that consequently
most of my open source efforts were directed toward this project. This
all took place around the time of the last iCPAN update, but I still had
hopes to keep iCPAN reasonably up to date. After all, it only took about
6 weeks of evenings and weekends to get a proof of concept up and
running for MetaCPAN. I would have plenty of time to keep iCPAN running
as well.\
\
How did this break?\
\
Things may have stayed reasonably on track, but an iOS update broke
iCPAN along the way. After many hours of debugging, I was just not able
to find the root of the issue, so I decided to rewrite iCPAN as a
Universal app (one with a native iPhone and iPad UI). I started working
on the iPad, but my personal resources were dwindling. The number of
developers working on iCPAN had been cut in half (from 2 to 1) and the
number of kids in our family had doubled (from 1 to 2). Now with a
newborn in the home, I didn\'t have the time or energy to finish off the
app. Any spare time I did have available was generally spent making some
small contributions to MetaCPAN where I could.\
\
Any day now\...\
\
By July of 2011 things had settled a bit and I was back at it, spending
a lot of late nights finishing up the iPad UI. I was [optimistic that
I\'d be able to release iCPAN
soon](http://blogs.perl.org/users/olaf_alders/2011/07/icpan-is-almost-on-the-ipad.html).
However, as I soon discovered, the consistent late nights were quite
productive in the short term, but the sleep deficit over the long term
made me generally unproductive during the day. I eventually had to
concede that my brain doesn\'t function well on little sleep, so I gave
up a lot of the late nights and put iCPAN on the shelf. It was nice to
have my brain back.\
\
A few months ago, I got the bug to finish things up. It had really been
bothering me that I had been telling people \"this thing is almost
done\" for so many months. I also saw the excellent [CPAN
Sidekick](https://play.google.com/store/apps/details?id=com.qubling.sidekick&hl=en)
in the Android app store and I was starting to feel a bit embarrassed
about not having iCPAN working. Bad (but fair) reviews for iCPAN were
piling up. I buckled down and spent any available free time on getting
this done. It turned out to be vastly more work than I had anticipated
or budgeted, but I did get the app to a releasable state about 1 week
ago when I submitted it to the app store.\
\
The Post-Mortem\
\
I\'ve learned a lot along the way. I\'ve learned Objective-C, XCode,
Interface Builder and iTunes Connect. I\'ve learned about managing certs
for releasing apps, how\
to distribute an app via an Ad Hoc Distribution (TestFlightApp in my
case) and how to keep the iPhone and iPad UI in the same app while
making sure that the logic\
uses shared classes. It has also made me appreciate Perl all that much,
in particular CPAN, Moose, DBIx::Class, built-in regex support and the
ability to express\
so much in Perl with very little code. I\'ve learned Apple\'s Core Data.
I know how to optimize an SQLite database with 80K rows in a table so
that it runs smoothly on a phone. (I could write an entire post on that
topic alone).\
\
iCPAN 2.0.0 has just over 80,000 documents available, which is a huge
improvement over the previous version. It has been downloaded over 1,300
times in the last 1.5 years. If you do like it, please take a moment to
review it in the app store or [watch it on
Github](https://github.com/oalders/iCPAN). If you don\'t like it, please
contact me or, even better, send me a pull request. :)

## Comments

Author: xiaoyafeng

Date: 05/24/2012 07:23:07 AM

  interesting! ;)

