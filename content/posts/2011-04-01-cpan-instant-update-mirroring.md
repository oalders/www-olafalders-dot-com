+++
author="oalders"
date=2011-04-01T04:57:32+00:00
title="CPAN Instant Update Mirroring"
type="post"
url="/2011/04/01/cpan-instant-update-mirroring"
categories=[
  "cpan",
  "instant update mirroring",
  "perl",
]
+++

If you\'ve got a CPAN mirror and you haven\'t had a chance to test out
the instant update mirroring, I\'m here to suggest you try it out. I had
a few spare moments earlier this week to test it out and I\'m happy to
say that the setup is trivial. If you follow [these
instructions](https://github.com/perlorg/cpanorg/wiki/Instant-update-mirroring),
you can get yourself set up in a matter of minutes. In my case it was
installing a couple of modules and then firing up the sync from the
command line. When I checked back later, I had around 9 GB of CPAN
goodness. As it happened, I uploaded a dist via PAUSE later in the day.
I remembered to check my new instant update mirror a few minutes later
and yes, my upload was already available in the mirror.\
\
This is good for a couple of reasons. First, no more waiting for hours
(or even a day) for files to appear on your local mirror. Second, this
means that if you\'re running your own CPAN indexer, you don\'t have to
do anything really fancy to get new dists as they are released. [You can
still do fancy
things](https://github.com/monken/cpan-api/blob/master/lib/MetaCPAN/Script/Watcher.pm),
but if you can put up with a 20 second lag, you\'re all set.\
\
As far as [MetaCPAN](http://search.metacpan.org) goes, we have the
option of using Moritiz\'s code to monitor FriendFeed for dist uploads
(noted above) or just watching the filesystem for changes and then
indexing the new dists as they get added.\
\
I think this is a really substantial improvement to the CPAN
infrastructure and a big **thank you** goes out to the folks who did the
heavy lifting on this!
