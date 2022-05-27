+++
author="oalders"
date=2010-11-17T05:06:23+00:00
title="iCPAN v1.0.2 is Now in Apple's App Store"
type="post"
url="/2010/11/17/icpan-v102-is-now-in-apples-app-store"
categories=[
  "cpan",
  "iphone",
  "objective-c",
  "perl",
]
+++

After about a week of waiting for an official review,
[iCPAN](http://itunes.apple.com/us/app/icpan/id377340561?mt=8) was
reviewed, approved and published to Apple\'s App store earlier today.
There are no code changes in this release, but the modules are up to
date as of Nov 8, 2010. This release also includes manuals and cookbook
POD like Moose::Manual.\
\
I had hoped to get this release out in September, but real life got in
the way. In the meantime, I\'ve streamlined the way the POD is processed
and future releases will be easier and hopefully much more regular.\
\
iCPAN has 732 downloads to date, which is about 632 than I had initially
hoped for when we started coding this app. Top downloading countries are
the US, Japan, Germany and the UK. So far, the response has been really
great. We\'ve gotten lots of helpful feedback from across the globe. The
biggest request has been for an iPad version. I\'ve been working on the
iPad version and [\@ioncache](http://twitter.com/ioncache) has been
working on a Universal version (which will work on both iPads and
iPhones/iPods). We\'re going to sit down and merge our work so that we
can get this working on the iPads, which is where it will really shine.\
\
As part of our work to get this working on the iPad we\'ve come to
realize that our work requires a web service. After batting some ideas
around, a small group of coders in Toronto.pm have gotten together and
[we\'ve put together a CPAN web
service](https://github.com/CPAN-API/cpan-api/wiki/API-docs) based on
[ElasticSearch](http://www.elasticsearch.com). It\'s still in the early
stages and quite volatile, but it already gives a lot of useful
information. \@ioncache has already coded a pure JavaScript CPAN search
to demonstrate how the API works. We\'ll make that public in the coming
weeks once it gets a few tweaks.

## Comments

Author: Mike Friedman

Date: 11/17/2010 04:04:14 PM

  Consider me 733, once I get home to my trusted Wifi network. For some reason, my phone does not want to download this app over 3G.


---

Author: Olaf Alders

Date: 11/17/2010 04:09:34 PM

  Excellent!  At around 70 MB compressed, it's a pretty hefty download for 3G.  :)


---

Author: Xavier Caron

Date: 11/18/2010 06:52:48 AM

  Nice job. Thanks a lot!


---

Author: Jay Allen

Date: 12/12/2010 06:52:41 AM

  Fantastic! This is something I've been really needing more and more recently. I just installed it and look forward to using it a LOT.  Thanks Olaf!

