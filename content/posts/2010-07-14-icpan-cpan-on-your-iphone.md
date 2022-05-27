+++
author="oalders"
date=2010-07-14T05:04:17+00:00
title="iCPAN: CPAN on your iPhone"
type="post"
url="/2010/07/14/icpan-cpan-on-your-iphone"
categories=[
  "cpan",
  "iphone",
  "objective-c",
  "perl",
]
+++

When I\'ve got a few minutes here and there, I like to browse the CPAN
for new, interesting modules. I wanted a way to do this quickly and
easily on my iPhone, without needing to get online to do it. This app
did not exist, so [\@ioncache](http://twitter.com/ioncache) and I set
about creating it. iCPAN has been available [in the Apple app
store](http://itunes.apple.com/app/icpan/id377340561?mt=8) for about 4
weeks now and we\'re currently working on updates for the next version.
([Our lightning talk slides](http://oalders.github.com/iCPAN/slides/)
have now been posted as well.)\
\
iCPAN works on your iPhone, iPod and even your iPad. Our initial release
of the app allows you to:\
\

-   search CPAN documentation by module name
-   bookmark your favourite modules
-   view your recent searches
-   browse the docs offline

\
\
\
The next release will add the following:\
\

-   Example code snippets in docs will be formatted via PerlTidy
-   These codes snippets will also feature syntax highlighting

\
\
\
There are still some issues we are working out. The main one is that the
module search is still very slow. We\'ve got a few strategies for
dealing with this, but we\'re still in the process of tweaking it.
We\'re also looking for some feedback and code contributions. If you
know a little Objective-C or just want to learn, you can check out the
code at <http://github.com/oalders/iCPAN>. The module processing is
written in Perl and the app itself is in Objective-C and they could both
use some improvements.\
\
The app download itself is about 60 MB and it expands to around 300 MB
on installation. There are well over 50,000 individual modules
represented and you can browse them and follow links via our built in
web browser. Please let me know what you think. Feature suggestions are
also welcome.

## Comments

Author: Steven Haryanto

Date: 07/14/2010 10:33:48 AM

  omg omg omg i want it so bad... Unfortunately I'm using Android right now. Anyway, it's really cool to have a Perl-related mobile app!


---

Author: John McNamara

Date: 07/14/2010 11:18:11 AM

  <p>
I installed the app and it is very nice. Well done.
</p>

<p>
I was thinking, along similar lines, of converting some of the perl* manpages, and possibly some modules, from Pod to ePub so I could sync them to the iBooks for reading offline.
</p>


---

Author: John Napiorkowski

Date: 07/14/2010 01:15:54 PM

  This is great, makes it easier for me to browse docs when I am remotely located (without internet).

I guess supporting something like "perldoc -m Module::Name" is going to be size prohibitive... but maybe it would be great if you could link to the source for when you actually have a connection.

Anyway, this is useful and great marketing for Perl.


---

Author: cowens.myopenid.com

Date: 07/14/2010 01:37:57 PM

  The two features I need most are:

1. Turn off search-as-you-type until searching becomes faster
2. A browsable list.  I want to click on WWW, then WWW::Mechanize, then WWW::Mechanize::Sleepy.

Right now the search is so slow I have to hit one letter, wait 5 seconds, hit the next letter, wait 5 seconds, and so on.  There is no need to search until I am done typing.


---

Author: LoonyPandora

Date: 07/14/2010 02:43:00 PM

  Seems like a nice idea - Any reason why you didn't do it as a web app with local storage? Too much data to store?


---

Author: Olaf Alders

Date: 07/14/2010 06:27:07 PM

  I have had a couple of people ask about Android.  I'm not to familiar with the SDK, but I think there's some code here that could be ported over to building something like that.  At the very least, some version of the code for the SQLite db could be used.  The hard work would be writing the Java!


---

Author: Olaf Alders

Date: 07/14/2010 06:29:23 PM

  Converting docs to epub sounds like a great idea.  Let me know if you get that going.  We may see about including some perldoc stuff in the app down the line as well.


---

Author: Olaf Alders

Date: 07/14/2010 06:36:39 PM

  Thanks, John! That's correct.  Source code would be very helpful, but when we looked into including the source code in the app, we realized that it would go well beyond Apple's size restrictions.  The apps are submitted in a .zip format and, I believe, 100 MB is the current limit.  The next release is going to be around 80 MB because of the extra overhead for syntax highlighting, so we're already tight on space.  The SQLite db zips up very nicely, but there's a lot of data to compress.

Having said that, I do believe we will add links to source code in one of the upcoming releases.  That should link either to the source on search.cpan.org directly or to a hosted URL which has syntax highlighting applied to the source code.  


---

Author: Olaf Alders

Date: 07/14/2010 06:40:44 PM

  You're right.  The search is way too slow.  This is basically our top priority to fix right now.  At the very least we should be able to add something in the preferences that would turn off the "search as you type" functionality.  It's a fairly big db for the amount of processing power and RAM that are available, so that's part of the problem.

Navigating the namespaces like you've suggested is also a very good idea.


---

Author: Olaf Alders

Date: 07/14/2010 06:47:08 PM

  <p>It probably would have worked really well as a web app, but our reasoning for choosing the app store was that we wanted an offline solution and we wanted to learn Objective-C.</p>

<p>
It was more about learning Objective-C, though.  I'd never used Xcode or Interface Builder before, so I was interested in seeing how it all works. Writing it as a web app would probably have required less work!</p>


---

Author: Offer Kaye

Date: 07/15/2010 11:26:13 AM

  Regarding ePub versions of perldoc, the site <a href="http://perldoc.perl.org/">http://perldoc.perl.org/</a> already offers PDF versions of individual pages and there's a downloadable tarball with all HTML and PDF files at <a href="http://perldoc.perl.org/perldoc.tar.gz">http://perldoc.perl.org/perldoc.tar.gz</a>


I've seen PDF->ePub converters on the web, so with a little Perl glue I'm sure you could run some batch script to convert all the PDF files into ePub ones :)

