+++
author="oalders"
date=2010-08-11T05:14:25+00:00
title="HTTP::BrowserDetect for all of your UserAgent parsing needs"
type="post"
url="/2010/08/11/httpbrowserdetect-for-all-of-your-useragent-parsing-needs"
categories=[
  "browser detection",
  "HTTP::BrowserDetect",
  "perl",
  "UserAgent",
]
+++

This module dates back to 1999, but as of late 2009 it had only been
patched twice over a 5 year period. The RT queue was full of very good
(but unapplied) patches. The world of browsers had also changed
considerably over this 10 year period, making the module helpful but
missing a lot of coverage. Since I didn\'t feel like rewriting this
module,I took the time to contact the author about seeing if he\'d allow
me to apply the patches. I\'m happy to say that he was very responsive.
He added me as a co-maintainer immediately and I set about working
through the queue.\
\
Since that time, the test suite has been improved, more UserAgents have
been added and it really is, once again, a tool which you can use with
confidence when detecting browsers. I\'d also like to note that once I
started moving through the available patches and made the repo available
on GitHub, I started getting lots of very helpful pull requests from
interested developers which have improved this module even more.\
\
As of yesterday, the RT queue is officially empty for the first time in
many years. So, if you\'ve avoided this module in the past because it
looked unloved, I invite you to give it another chance. Additionally, if
you\'d like to send me a pull request with your improvements, I\'d be
more than happy to incorporate them.

## Comments

Author: illusori.myopenid.com

Date: 08/11/2010 06:39:21 PM

  I noticed this module becoming active again last year, which was an unexpected and happy surprise since I'd noticed it becoming increasingly out-of-date over the years.

Just wanted to take the opportunity to say thank you for resurrecting it.


---

Author: meraxes

Date: 08/11/2010 08:37:20 PM

  <p>I'm hoping to use it to replace some REALLY hacky code on one of our mobile sites!  So many ifs and elses.  So bad. So evil.</p>

<p>Any users in the mobile space should also check what you're passing to HTTP::BrowserDetect.  If it's coming through Googles Transcoder it changes the User-Agent header and adds a X-Original-User-Agent and X-Device-User-Agent.  Always good to check if those are populated because "Google Wireless Transcoder" won't help you much.</p>


---

Author: John Napiorkowski

Date: 08/11/2010 08:48:06 PM

  This is great, karma to you for taking charge of this.  I see the github move as very positive as well, making it much easier to patch going forward.

Thanks!  __John


---

Author: StommePoes

Date: 08/12/2010 01:28:20 PM

  I don't want to rain on the party, and definitely appreciate people updating modules... as Matt would say, "well-volunteered!"

However, I need to say browser sniffing is generally a very very very bad idea (well, maybe that depends what you're doing with it, I suppose).  Browsers lie.  About everything. Who they are.  What they're running on. And nobody keeps track of the over 100 UA strings out there... if they do, they don't remain updated... which is why Facebook will send Konqueror Desktop browser to their mobile page.  Oops, they forgot a browse or two or...


Opera calls itself Internet Explorer and has for a very long time (of course not counting those people who like to set silly names like "Oprah" and "SuperBrowserVersion42").  Opera 10 got hit by older JS-based sniffers by having a 2-digit version number (it became "Opera 1").  Most other browsers let you set whatever you want, and then there are the emulated browsers (like Multiple IEs).  Mobiles are no better: sometimes identifying themselves as some mobile version of Browser X, other times making no difference.  Or lying about not being a mobile browser in order to give the user the "good" version of the page (to prevent redirects).

Just... be very very careful what you do with this.

Again, karma++ for helping CPAN modules (and then blogging about it... go Perl!).


---

Author: Olaf Alders

Date: 08/12/2010 05:46:37 PM

  Thanks for the comments, everyone.  It's nice to appreciated.  :)<br /><br />

@StommePoes  You do raise a very good point and there are certainly pitfalls to basing web content strictly on what has been reported as the UserAgent.  There are, however, good reasons for UserAgent parsing (like web analytics).  Just like any info reported back by the browser, the user needs to be aware of spoofing and other pitfalls.
<br />
Having said that, this module does some of the heavy lifting so that you don't have to do it.  A good case in point is the issue of Opera version 10.00 being reported back as 9.80.  I've just patched HTTP::BrowserDetect with the help of a developer at Opera in order to address this issue.  As you said, there's no reason for any one developer to need to keep track of the many UserAgent strings out there, but with some collective effort, a module like this can centralize that knowledge and provide a little help for those who might find it helpful.  
<br />
It's generally a bad idea to use this info strictly for UserAgent-based layouts, but it's certainly helpful when dealing with some browser quirks.  For instance, you can single out IE6 quite easily without a) parsing the string yourself or b) being forced to rely on JavaScript.  I think that's a strong argument for something like this.


---

Author: Sawyer X

Date: 08/16/2010 07:49:54 AM

  I only got around to reading this now. I flagged it to read later and now I have.

I wanted to say GOOD JOB!

I remember seeing it once and I had no reason to use it (still don't) but figured it's too old and outdated. It's great to know that now I can use it and count on it.

But, whether I will use it or not, I want to thank you for the hard work and pitching in and all that. It's great! :)

