---
title: meta::hack Wrap-up Report
author: oalders
type: post
date: 2016-12-01T02:54:10+00:00
url: /2016-12-01-metahack-wrap-up-report
dsq_thread_id:
  - 5502199435
categories:
  - MetaCPAN

---
<h1 style="text-align: center;">
  meta::hack v1
</h1>

Earlier this month (Thu, Nov 16 &#8211; Sun, Nov 20) I had the pleasure of meeting up with 7 other Perl hackers at ServerCentral’s downtown Chicago offices, in order to hack on MetaCPAN. Before I get started, I'd like to thank our sponsors.

This hackathon wouldn't have been possible without the overwhelming support of our sponsors. Our platinum sponsors were [Booking.com][1] and [cPanel][2]. Our gold sponsors were [Elastic][3], [FastMail][4], and [Perl Careers][5]. Our silver sponsors were [ActiveState][6], [Perl Services][7], [ServerCentral][8] and [Advance Systems][9]. Our bronze sponsors were [Vienna.pm][10], [Easyname][11], and the [Enlightened Perl Organisation (EPO)][12]. Please take a moment to thank them for helping our Perl community.

For the past 2.5 years, we’ve been working off and on at porting MetaCPAN from Elasticsearch 0.20.2 to 1.x and (eventually) 2.x. There were enough breaking changes between the versions to make this a non-trivial task. We had made very good progress over the past two QA hackathons, but the job was just too big to finish in the hours that we had available.

After the QA Hackathon in Rugby, I spoke to Neil Bowers about how we might go about doing some fundraising. Neil was so kind as to offer to help. His offer to help soon evolved into him taking on all of the work (thanks Neil)! Neil worked his magic and got the event fully funded. I know there was a lot of work invovled, but he made it look easy. Mark Keating and the Enlightened Perl Organization kindly took on the financial side of things, invoicing and accepting payment from sponsors. Without EPO and Neil, this event never would have taken place. (Please do take a moment to thank them).

While this was going on, we began searching for a venue. Joel Berger offered to host us at ServerCentral in Chicago and we immediately took him up on the offer. After that it was just a matter of folks booking plane tickets and getting approval from employers for the time off.

The final list of invitees was:

  * Brad Lhotsky (San Francisco)
  * Doug Bell (Chicago)
  * Graham Knop (Baltimore)
  * Joel Berger (Chicago)
  * Leo Lapworth (London)
  * Mickey Nasriachi (Amsterdam)
  * Olaf Alders (Toronto)
  * Thomas Sibley (Seattle)

The event was invitation only. We did this in order to maximize the amount of work we’d be able to finish at the event. [Insert reference to “The Mythical Man Month”]. Everyone who participated was already up to speed on the internals of the project or has an area of expertise which we needed in order to complete our goal of launching fully with v1 of the API. Because everyone already had a working VM and working knowledge of the project, we were able to tackle the problems at hand right from the first morning.

As far as living space goes, we initially had looked at renting hotel rooms, but the cost would have made it almost prohibitive to meet in Chicago. After doing some research, we booked two apartments (each with 3 bedrooms) on the same floor of a condo building in the Lincoln Park area of Chicago. We booked the accommodations via [booking.com][13] of course. 🙂 I think we were happy with the housing. Everyone had their own room and we had big enough living rooms for all of us to meet up mornings and some evenings. At the end of the day the rental was a fraction of the price of a Chicago hotel. I’ve also made a mental note not to be the last one to arrive in town. Apparently it also means you get the smallest room.

Each day we took the subway downtown to ServerCentral. We had a dedicated boardroom in the office with a large TV that we could use for sharing presentations, IRC chat or error logs. ServerCentral also sponsored lunch each day of the event. Extra monitors were also available for those who wanted them. (Lots of Roost laptop stands were to be seen. Also lots of people who couldn’t figure out how to open them after having collapsed them for the first time in forever).

After settling in at the office we’d discuss our plans for the day and map out goals for that day. We had breakout discussions where appropriate but the time spent not writing code was minimal. Generally, as a group, we worked well into the evenings. We didn’t get the full Chicago experience, but we got a lot done. We did make it to the Chicago Christkindlmarkt, which was a few blocks from the office and we went out for a breakfast and a dinner as well. Minimal downtime, but the breaks we had were lots of fun.

Day one was spent removing anything which was blocking the API upgrade. Wishlist items were ignored and as a group we worked really well. Lots of pull requests were created, reviewed and merged.

By day two of the hackathon we flipped the switch and went live with the new API. We could have waited a bit longer, but we opted to make the change earlier so that we could troubleshoot any issues as a group and watch the error logs in real time. There were no showstopping bugs and the transition was actually pretty smooth.

Day three was spent squashing some of the bugs which came up after the upgrade. We also started to tackle some wishlist items.

Day four was a slightly shorter day. We wrapped around 4 PM. Some of us went to check out “the Bean” before flying out while Leo and I headed right for our respective airports.

This list is by no means exhaustive, but over this long weekend we:

  * moved ++ data to v1 of the API.
  * moved <https://metacpan.org> to v1 of the API.
  * implemented load balancing via Fastly, our CDN sponsor.
  * reduced noise in the logs by squashing bugs which generated warnings or exceptions.
  * updated our API documentation as well as the metacpan-examples GitHub repository from v0 to v1.
  * published an upgrade document which explains to how upgrade your query syntax and configuration for v1.
  * moved <http://explorer.metacpan.org> to v1 of the API.
  * began work on streaming logs to Elasticsearch.
  * began moving the query logic that [metacpan.org][14] uses over to the API so that other clients can use this same logic.
  * began porting author queries from [metacpan.org][14] to the API as well.
  * added a meta::hack event page along with sponsor info to [metacpan.org][14].
  * continued work on adding a /permission endpoint which will provide access to the data in 06perms.txt.
  * added more tests for the /download_url endpoint which translates module names into download URL. Specifically this is meant to be used by cpanm.
  * added snapshotting of Elasticsearch indices in v1 so that we can easily restore from backup.

/permission is something I spent a fair bit of my time working on over the last two days. Having 06perms.txt data in the API will mean that we can display a list of all authors who have maint on a module on [metacpan.org][14]. This will make it easier to track down authors who can release a module, particularly for those who aren’t familiar with the way PAUSE works. I think this branch is probably about 1.5 years old, so I was happy to get the time to try to finish it off. I didn’t quite get there, but that’s okay. It was a wishlist item and it’s actually quite close to being released.

Also of note is the fact that we’ve now officially deprecated the v0 API. There is a 6 month runway to move clients over to v1 and v0 will be taken offline on or after June 1, 2017.

Since <https://metacpan.org> now uses v1 of the API, results for v0 are no longer available. If you have a client which uses v0 of the API, please feel free to reach out to us with any concerns you may have about making the switch.

If you rely on updated ++ data, you’ll need to switch to v1 now, as ++ data in v0 is no longer being updated. The indexer is, however, still running on v0, so it will still find and index new CPAN uploads. v0 development is officially closed. Any v0 bugs (barring catastrophic issues) will likely not be addressed. v0 has been around for just over 6 years now. It has served us well, but it’s time to let it go. [Insert musical scene with a talking snowman, an ice queen and her loyal sister.]

 [1]: https://www.booking.com
 [2]: http://cpanel.com/
 [3]: https://www.elastic.co/
 [4]: https://www.fastmail.com/
 [5]: http://Perl.careers/
 [6]: http://www.activestate.com/perl
 [7]: http://www.perl-services.de
 [8]: https://www.servercentral.com/
 [9]: https://advancesystemsinc.com/
 [10]: https://www.meetup.com/Vienna-Perl-Mongers/
 [11]: http://easyname.at/
 [12]: https://www.enlightenedperl.org/
 [13]: http://booking.com
 [14]: http://metacpan.org
