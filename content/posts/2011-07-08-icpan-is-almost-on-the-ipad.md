+++
author="oalders"
date=2011-07-08T05:36:36+00:00
title="iCPAN is (almost) on the iPad"
type="post"
url="/2011/07/08/icpan-is-almost-on-the-ipad"
categories=[
  "cpan",
  "iCPAN",
  "iPad",
  "iPhone",
  "MetaCPAN",
]
+++

[iCPAN](http://itunes.apple.com/us/app/icpan/id377340561?mt=8) hit the
app store about a year ago. I didn\'t really expect there would be a lot
of downloads, but the reality is that there was far more interest than I
had expected, which is good. After the original app was released, I was
able to release a couple of subsequent versions with updated Pod, but it
soon became clear that some problems were not being solved.\
\
The first issue was that it was taking a very long time to put a build
together, because I had to parse all of minicpan with each run. The
second issue was that my coverage was too low, around 60,000 docs. A lot
of docs were being missed and there were a lot of edge cases to work
out.\
\
So, we discussed this at Toronto.pm one night and batted around the idea
for a CPAN web service to make building the app easier. We figured
rather than just making something that the app could use, we would build
an API which anyone could use. At the end of our meeting, a bunch of
friendly folks threw \$20 bills at me. I started up a server in the
Rackspace cloud and [MetaCPAN](http://metacpan.org) was born.\
\
\@ioncache and I spent almost all evenings and free time for the next 6
weeks putting this together. I worked on the back end parsing and
[ElasticSearch](http://elasticsearch.com) setup. He built
[search.metacpan.org](http://search.metacpan.org) as a proof of concept
that the API actually worked and that it might one day power a next
generation CPAN search. As for the actual building of the search site,
the intention was to leave this to someone with more resources (read:
time) available.\
\
This worked out really well, but it diverted my attention from iCPAN. I
figured this was fine, since the lasting effects of MetaCPAN on the Perl
community had the potential to be much more powerful than that of an iOS
offline CPAN browser. If nobody cared about the API, I\'d still have it
for iCPAN.\
\
Now that I had the API, it was time to look at iCPAN once again.
However, this is about the time that the impending birth of my second
child began to show some complications. Happily, everything eventually
worked out incredibly well and we have a happy, healthy baby on our
hands, but it shifted my focus away from open source work and it was
also a very real lesson for me that are very good reasons why an author
of module or project X may fall behind on open issues, become
unresponsive etc. Sometimes life just puts you on a different path and
everything else has to wait. That doesn\'t mean your patch isn\'t
important, but it may mean that it won\'t be merged in right away, and
that\'s OK too.\
\
Around this time, [Moritz Onken](http://blogs.perl.org/users/mo/) came
along and started improving (read: tearing out) the guts of the code I
had written. He got very involved, did a lot of great things and now
he\'s at the halfway point of a very productive Google Summer of Code
project. Lots of people know about MetaCPAN, lots of people use it and
lots of people complain about what they don\'t like (which is a good
thing). Part of the GSoC project is the building of the search site I
was hoping someone would take on. So, that has worked out wonderfully
and the timing was great. While I was out of commission, Mo was able to
move things forward very rapidly.\
\
One thing I\'ve drawn from all of this is that it turned out to be a
really good idea to decouple the API from the search site. It allows new
contributors to start patching the front end code immediately, without
having to care about the inner workings of the API. More importantly,
they don\'t ever have to install a local version of the API themselves.
They can work off the live API and be incredibly productive.\
\
So, all of this meandering brings me to the iPad. Now that little Celia
is sleeping through the night, I\'ve been able to open XCode once again
and marvel at how incredibly verbose Objective-C is. I\'ve spent most
evenings for the last 5 weeks or so working on iCPAN. A recent iOS
upgrade broke it completely and we were unable to locate the actual
source of the bug, so this seemed like a good time to rewrite the app
from scratch and convert it from an iPhone app to a universal app (one
that runs on both iPhone/iPod and the iPad).\
\
I\'m at the point where the iPad GUI is now working:\
\
[![ipad_syntax_highlight.png](http://blogs.perl.org/users/olaf_alders/assets_c/2011/07/ipad_syntax_highlight-thumb-600x450-533.png){.mt-image-center
width="600" height="450"
style="text-align: center; display: block; margin: 0 auto 20px;"}](http://blogs.perl.org/users/olaf_alders/assets_c/2011/07/ipad_syntax_highlight-533.html){onclick="window.open('http://blogs.perl.org/users/olaf_alders/assets_c/2011/07/ipad_syntax_highlight-533.html','popup','width=1024,height=768,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false"}\
\
The cool part is that the iCPAN database is now largely being extracted
directly out of [MetaCPAN](https://github.com/CPAN-API/cpan-api), which
has simplified what I\'m trying to do to a very great degree. The iPhone
GUI has yet to be built, but that should start shortly. I\'d like to get
this into the app store quickly so that Perl hackers will stop giving it
1 star reviews for being broken. ;)\
\
Having said all of that, if you\'d like early access to the iPad
version, I can add you to the Ad-Hoc Distribution list. I plan to start
pushing out beta builds in the next 10 days or so. If you\'d like to get
a build to run on your own iPad, you can sign up at TestFlightApp.com:
<http://bit.ly/kPichL>. You can also sign up if you don\'t own an iPad,
of course. Subsequent builds will work on other iOS devices.\
\
If you\'d like to follow the project on Github, it\'s here:
<https://github.com/oalders/iCPAN>. I\'ll also post updates on
[Twitter](http://twitter.com/wundercounter) If you have Objective-C
chops and would like to help, please do so. If you have no Objective-C
chops and would still like to help, please get in touch as well. I
don\'t claim to be any kind of an expert, but I\'m happy to share what I
know in order to get other people started building iOS apps as well.

## Comments

Author: Vyacheslav Matyukhin

Date: 07/08/2011 11:30:44 AM

  New iCPAN release will still be offline, right?
Do you have any plans for mobile version of metacpan web interface?

By the way, thank you for these projects, I didn't realise you wrote *both* of them :)


---

Author: bart

Date: 07/08/2011 01:49:31 PM

  Well somehow I have a hard time imagining a program that depends on web services ,as "offline".


---

Author: Vyacheslav Matyukhin

Date: 07/08/2011 02:34:09 PM

  Maybe I'm wrong, but I as far as I understand it, iCPAN embeds all PODs in the app, and web service is needed only when app is built.  So you have to update the whole app to get fresh docs.
At least, that's how old iCPAN worked.

Maybe new release will change the paradigm, but I don't see it mentioned in this post.


---

Author: Olaf Alders

Date: 07/08/2011 03:03:59 PM

  Yes, the new release will still be offline. There will be a "view source" link that will need to go online for that content, but the basic functionality won't require any sort of connection. We may add "live" searching in future, but I'm just keeping it simple for now so that I can get it out the door faster.


A mobile version of the metacpan web interface isn't specifically on the "to do" list, but that's probably because nobody has volunteered to do it yet. :) 


---

Author: Randy Stauner

Date: 07/12/2011 04:02:55 AM

  I, too, have wondered about a mobile cpan site... search.cpan.org isn't terrible since the site itself is fairly simple (and the browser (at least Dolphin) wraps the text well enough), but often verbatim blocks require scrolling (not to mention any other site actions like searching).

I'm sure metacpan.org could have a good mobile version...

Have you heard of anyone working on an Android app?  I can run perl scripts on my android but there's nothing for viewing perldocs.


---

Author: Olaf Alders

Date: 07/12/2011 05:37:05 PM

  I don't know of anyone working on a mobile app for Android. <a href="http://twitter.com/ioncache" rel="nofollow">@ioncache</a> was thinking of an HTML5 app that would have the same basic functionality and would just exist in a WebView. That could then be easily ported to iOS and Android, but there are no real plans to implement that at this point.

