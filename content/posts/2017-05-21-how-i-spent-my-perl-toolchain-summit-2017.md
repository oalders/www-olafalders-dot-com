---
title: How I Spent my Perl Toolchain Summit 2017
author: oalders
type: post
date: 2017-05-21T16:31:49+00:00
url: /2017/05/21/how-i-spent-my-perl-toolchain-summit-2017
categories:
  - Perl
  - Programming

---
This was my 5th year of being invited to participate in the Perl Tool Chain Summit (formerly Perl QA Hackathon). It was a real pleasure to be invited to a rebranded version of the same helpful event.

## Our Sponsors

This event would not have been possible without our sponsors. Let me take a moment to thank:

  * [Booking.com](http://www.booking.com)
  * [ActiveState](http://www.activestate.com)
  * [cPanel](https://cpanel.com)
  * [FastMail](https://www.fastmail.com)
  * [MaxMind](https://www.maxmind.com/en/home)
  * [Perl Careers](https://opensource.careers/perl-careers/)
  * [MongoDB](https://www.mongodb.com)
  * [SureVoIP](http://www.surevoip.co.uk)
  * [Campus Explorer](http://www.campusexplorer.com)
  * [Bytemark](https://www.bytemark.co.uk)
  * [CAPSiDE](http://capside.com/en/)
  * [Charlie Gonzalez](https://metacpan.org/author/ITCHARLIE)
  * [Elastic](https://www.elastic.co)
  * [OpusVL](http://opusvl.com)
  * [Perl Services](http://www.perl-services.de/)
  * [Procura](https://www.procura.nl/)
  * [XS4ALL](https://www.xs4all.nl/)
  * [Oetiker+Partner](http://www.oetiker.ch/)

## Overview

For the second year in a row, MetaCPAN was well represented at the event. This is important because it really does allow us to get much more work done. Getting everyone in the same room allows us to make decisions quickly and often deploy new ideas on the same day they've been discussed. Just like last year, we got a lot accomplished this year. I'm only going to touch on the work which I was directly involved with. [Leo Lapworth][1], [Mickey Nasriachi][2] and [Graham Knop][3] both did much more than I'll cover here.

I'm going to tackle this in roughly chronological order.

## Wednesday

I arrived on Wednesday evening, and met up with most of the others at a local restaurant. It was good to see familiar faces and talk about what people had planned for the coming days.

## Thursday

Thursday was the first real day of work. I had gotten the 06perms index into MetaCPAN API as part of my preparation for PTS, but it wasn't yet exposed via the UI. So, on the Thursday I made it my mission to begin the front end work. I also spoke with [Paul Johnson][4] and Leo Lapworth about tighter integration of [cpancover.com][5] into MetaCPAN. I think this is important because many people probably don't know about [cpancover.com][5]. This site runs coverage tests on all modules at upload time. It's a great service and something that more people should probably know about.

In the evening we went out as a group to an Ethiopian restaurant. That was a first for me and I really enjoyed it.

## Friday

On Friday we went live with the 06perms work from the previous day. Once it was up and running, [Neil][6] suggested I write [a blog post][7] to get the word out about the new feature.

The module permission views have already allowed people to spot inconsistencies in some module permissions. I had some back and forth with [Babs Veloso][8] and Neil about the permissions UI. We'll be improving the UI moving forward, but it was important to get something out there now rather than perfecting it first.

I took a few minutes to release a new [Net::HTTP][9] which consisted of a patch from [Shoichi Kaji][10], who was sitting just a few feet away from me at the time. I did this after a code review from [Karen Etheridge][11], who was sitting in the next room.

I also got in a pull request to change some of the copy on the show more/less links for large Changes files.

## Saturday

At meta::hack this past Fall, Joel Berger had worked on moving the MetaCPAN module search from the front end to the API, so that anyone could use it. We quietly merged his changes earlier this year, but the endpoint was lacking in tests and documentation. This was no fault of Joel's. Leo set about to document this new endpoint and I spent part of my Saturday helping with this. He wanted to make some code changes, but didn't want to do this without existing unit tests. So, I wrote some passing unit tests for the master branch and he used them in his documentation branch to establish that nothing was being broken by his cleanup work. Now we have better test coverage, some more documentation and better organized code.

While I was working on the tests, I came to the realization that our Travis build times were going to be very problematic. Some of our builds were taking up to 45 minutes or longer. This isn't a huge issue on normal days where you can push something and come back to it later in the day. However, at a hackathon, where many people are pushing many branches, it becomes a significant constraint. Waiting 30-45 minutes for a passing build before a branch can be merged can be a real problem.

The TLDR is that build times are now in the 5-10 minute range for both the front and back end code. That was a fun journey for me and will be the subject of its own blog post. There's some information in there which can be helpful to other projects.

As part of my efforts to speed up the build, it was helpful to have Shoichi Kaji sitting at the next table. I had a question about [App::cpm][12] and he helped me with a code sample and an explanation immediately. That allowed me to shave 50% off the build time for installing CPAN modules. I also had an issue with a test suite which needed some files to run sequentially and some in parallel. Graham Knop had an answer for me within minutes and [Leon Timmermans][13] came over a bit later to help me get the implementation right. This helped me squeeze a lot of extra performance out of the build in a very small amount of developer time.

I also took some time to add some missing meta::hack sponsors to the MetaCPAN sponsors page. I also got a very old pull request merged which fixes a bug that showed user favorites for modules which had been deleted.

Saturday evening a group of us walked into the old part of town. Leo Lapworth, [Nicholas Rochelemagne][14], [Joel Berger][15] and I ended up a really fun little restaurant called Chez Sylvie, which offers regional cuisine. Some of us had eaten there three years ago and I had good memories of it. I'm happy to say that it did not disappoint.

## Sunday

By Sunday, now that we had faster Travis builds, I took a proper look at the build logs and it became clear to me how noisy our build output was. It was really hard to distinguish between real problems and noise that just needed to be suppressed. I spent a fair bit of time working on that. I'm happy to say that build logs are now extremely succinct. Moving forward it will be much easier to spot warning messages as they appear and deal with them immediately. I also spent time with Leo troubleshooting MetaCPAN search results on the staging machine.

I had a discussion about producing a new, cleaner 02packages file for PAUSE. This would be an additional file which PAUSE produces, which I'm sure will be the subject of a blog post from someone else. As a MetaCPAN developer group, we had additionally had discussion about logistics for meta::hack v2, which we're hoping to hold later this year. Exact date and location have yet to be determined.

I got on TGV from Lyon to Paris to finish off the day.  While on the train I spent some time partially implementing [CPAN river data][16] into the MetaCPAN UI.

Added to all of this, Mickey kept me busy every day reviewing code from his pull requests. He was also a valuable resource in helping me to get my own work finished faster.

I'd also like to send a special thankyou to Travis CI. Their customer support was excellent. I had told them we were at a hackathon and having some build issues and they immediately sprang into action. They played a big part in our weekend being even more productive.

Finally, I'd like to thank my employer for giving me time to attend the summit. To me, it feels like on the job training. I learned a great deal while I was hacking and/or chatting with other attendees. I'll be able to put this knowledge to use on various open source and $work projects as I move forward.

## Postscript

I spent my Sunday evening walking around Paris.  I walked from Notre Dame up to the Eiffel Tower, mostly along the Seine.  I got up early the next morning for a run.

![/wp-content/uploads/2017/05/Screenshot-2017-05-15-13.09.43-2048x1135.png](/wp-content/uploads/2017/05/Screenshot-2017-05-15-13.09.43-2048x1135.png)

I then caught a plane from CDG to FRA.  At FRA I got into a plane bound for YYZ.  After an apparently successful takeoff from FRA we were informed that the flight behind us had spotted liquid leaking from our aircraft.  The flight crew had then ascertained that one of the hydraulic systems was no longer functional.  So, we had to [dump 54 tonnes of fuel][18] before landing back at FRA with loads of emergency vehicles waiting for us on the ground.  We then spent probably a couple of hours in the aircraft while crews assessed the damage.  No air conditioning or meals were available during this time and eventually we all piled into buses that brought us back to the terminal.  Then into another bus that brought us to a fancy airport hotel where there was a warm meal waiting for us.  I got a text that my flight was rescheduled for 18:30 the next day.  For various reasons my 18:30 flight actually left the ground at 22:30.  So, I got to YYZ on Wednesday at 00:30 rather than on Monday at 19:30 as originally planned.

I'm glad we all got home safely.  The way the airline handled it was mostly fine.  It was a bit weak on communication, but it otherwise decent.  My big takeaway is that I've learned for next time to pack more stuff that I think I might need into my carry on rather than my checked bag.  🙂

 [1]: https://metacpan.org/author/LLAP
 [2]: https://metacpan.org/author/MICKEY
 [3]: https://metacpan.org/author/HAARG
 [4]: https://metacpan.org/author/PJCJ
 [5]: http://cpancover.com
 [6]: https://metacpan.org/author/NEILB
 [7]: http://www.olafalders.com/2017/05/13/viewing-your-module-permissions-on-metacpan/
 [8]: https://github.com/babsveloso
 [9]: https://metacpan.org/changes/distribution/Net-HTTP
 [10]: https://metacpan.org/author/SKAJI
 [11]: https://metacpan.org/author/ETHER
 [12]: https://metacpan.org/pod/App::cpm
 [13]: https://metacpan.org/author/LEONT
 [14]: https://metacpan.org/author/ATOOMIC
 [15]: https://metacpan.org/author/JBERGER
 [16]: http://neilb.org/2016/05/01/qah-river-discussion.html
 [17]: /wp-content/uploads/2017/05/Screenshot-2017-05-15-13.09.43.png
 [18]: http://www.t-online.de/nachrichten/panorama/id_81217230/flugzeug-laesst-54-tonnen-treibstoff-ueber-pfalz-ab.html
