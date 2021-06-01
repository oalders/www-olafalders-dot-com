---
title: Perl Toolchain Summit 2018 Wrap-up Report
author: oalders
type: post
date: 2018-04-27T13:41:08+00:00
url: /2018/04/27/perl-toolchain-summit-2018-wrap-up-report
categories:
  - MetaCPAN
  - Perl
  - Programming

---
# Perl Toolchain Summit 2018 Wrap-up Report

## Getting There

This year I had the pleasure of attending the Perl Toolchain Summit in Oslo, Norway. Because of a conflict in my schedule, I initially didn't think I'd be able to attend. After a lot of mental back and forth, I decided I'd try to make it work. The compromise was that this year I would leave on Sunday morning rather than on Monday. That meant I wasn't able to participate in the last day of the summit, but I'd still have 3 entire days to get things done.

I left Toronto on Tuesday evening and arrived in Frankfurt on Wednesday morning. I got breakfast in Germany and after a two hour layover I was on a short flight to Oslo. From the Oslo airport I took a train into town.

I got into my tiny, tiny room and changed into my running clothes. I spent the next couple of hours running mostly along the water and making lots of stops along the way to take pictures and hang out. That was enough to burn off any excess energy.

![][1]

In the evening I met up with everyone else at a bar called RØØR. Here it finally became clear to my why Salve had said alcohol would be expensive. (I hadn't really believed him when he originally let us know). I had a great time regardless and it was nice to see a lot of familiar faces and catch up.

## Day One

On Thursday morning we had an 8:30 breakfast at the venue and then 9:00 AM standup, where everyone had a chance to introduce themselves and talk about what they intended to work on. Leo and Mickey had a claimed a small room for our group, which meant that for the span of the summit we would all be able to sit around the same table and whiteboard. Some folks dropped by early in the morning to talk about a few items on their wish list. We also made a game plan for the summit and made various work assignments amongst ourselves. These sorts of face to face meetings are what make the summit invaluable. The first morning meeting allowed us to get everyone on the same page and then get to work.

This year we didn't come into the summit with any one grand project to complete. Rather, we spent some time on smaller items, bug fixes, attending to outstanding issues on Github and infrastructure work. Specifically, we're generally working towards having a better disaster recover plan and failover capacity for MetaCPAN. Leo did a lot of work on that, so I'll let him blog about his contributions. For my part, I picked back up on the work that I had started at meta::hack this past November.

At meta::hack I had spent a good chunk of time upgrading our Debian from Wheezy to Stretch. This is an upgrade of two major releases and it turns out to be non-trivial in our case. A large part of the problem is that with our current setup we are on a version of Puppet (3.8.7) which is no longer supported. Since Wheezy has a newer Puppet (4.8.2) by default, I took this as an opportunity to upgrade Puppet. This meant that some of our Puppet config needed updating and that we also need to update our PuppetForge modules (3rd party dependencies). This was complicated enough that I was going to need a lot of help from Leo, so I sat myself beside him in order to make bothering him more convenient for the both of us. It turned out that I bothered him _a lot_. I shudder to think how long it would have taken me to work through this remotely. I can't say that I enjoyed the work, but it was much more enjoyable to do this face to face and it was a much better use of everyone's time.

Thursday also happened to be Leo's birthday so we went out for drinks and various foods made of pork at a bar called Crowbar. Marcus Ramberg and Batman joined us there and eventually a good chunk of the attendees came along as well.

## Day Two

I had gotten the bulk of the upgrade done on Thursday. On Friday I got up early and went for a run. Then, at the venue we continued tying up some loose ends on the Debian/Puppet upgrade and getting Leo involved in testing it out. I should add that part of this upgrade also included an overhaul of how we build our Vagrant boxes. Currently if you want to deploy a Vagrant instance you download a pre-built box which we have uploaded to one of our servers. Moving forward you'll be able to build your own box on demand. It will take slightly longer to get set up, but you'll have the latest and greatest software right away and you won't need to rely on any one of us to upload an updated box for you to download. In the evening we all went out to a restaurant where there were speeches, excellent food and great conversations.

## Day Three

On Saturday morning, Mickey and I met up at 6:30 AM for a quick run. At 7:30 AM we met up with Leo and Sawyer and rented some bikes. We cycled along the waterfront by the fortress and the Opera House before making it back just in time for standup. By now we were upgrading Debian and deploying the new Puppet on two of the three machines which Bytemark generously donates to us. This turned out to be non-trivial as the first machine we upgraded would not reboot. After some excellent technical support from Bytemark we were able to get past this as well.

I also added a URL mapping for static files to the MetaCPAN API. This is a first step in self-hosting some API documentation, likely using Swagger in some way. This is partly what's preventing the MacOS Dash application from having more Perl documentation available.

In the evening most of us hung out at a local hacker/maker space. For me, it was a nice way to wrap up the summit.

## In General

While all of this was going on, we also had a good debate about sponsorship of our project. We've been getting a lot of interest from potential sponsors over the last year or so and we've mostly been approaching it on a case by case basis. Having everyone in on a group discussion allowed us to set a sponsor policy moving forward that we think will be good for both us and our sponsors. (If your company would like to sponsor MetaCPAN or our next meta::hack conference, please don't hesitate to get in touch with me).

I also fit in the usual code reviews over the 3 days and also tried to catch up on some outstanding Github issues. It turns out I had missed some entirely. There were issues going back as far as January which had not yet been responded to. 🙁

As part of some of the other work going on, there was progress made towards a tighter integration of the CPAN river data in the MetaCPAN API. Also, we now have access to Neil Bowers' CPAN river data generator. There's a plan to have MetaCPAN directly generate this data, rather than having us pull the data from him.

There was also a fair bit of discussion as to where to host the 2018 meta::hack. Our TODO list is long enough that the Perl Toolchain Summit isn't quite enough for us to make the progress that we think we need to make. So, hopefully, we'll be able to get together once more this year to continue to make progress.

Additionally Babs Veloso showed us a proposal for a redesign of the MetaCPAN author pages. It looks great. Now we just need to find someone to implement it. We also spent a fair amount of time on a part of the project which I can't actually tell you about just yet, mostly because the details haven't all been finalized yet. If all goes as expected, we'll announce that in the coming months.

## Getting Home

My flight back early on Sunday was uneventful. I spent an hour in Copenhagen and then was back home on Sunday afternoon in time to take the kids to the park. I got into an Eastern Standard Time sleep schedule by Sunday night. I dropped the kids off at school on Monday morning and then flew off to Boston for meetings until the following Friday. Since I telecommute, I rarely need to travel (or even wear shoes), but for some reason I ended up with back to back trips this year. In the end, it all worked out.

## Thanks

On the whole this year's PTS was very productive, fun and very well organized. I'd like to thank Salve J. Nilson, Neil Bowers, Stig Palmquist, Philippe Bruhat, Laurent Boivin and anyone else I may have missed. The venue, food, level of organization (and hoodies) were all excellent. It was a smooth experience from start to finish. I feel like I was able to get a lot of good work done and I am particularly pleased that I was able to finish what I had set out to do. Collectively, there was much more work completed on MetaCPAN than what I've described.

I would not have been able to make this trip without the support of [MaxMind][2] (my employer). MaxMind has sent me to PTS without hesitation each time that I've been invited and has also been a sponsor of the event for these past two years. Thanks, MaxMind!

Additionally, I'd like to thank all of our sponsors, without whom this would not have been possible:

[MaxMind][2],
[NUUG Foundation][3],
[Teknologihuset][4],
[Booking.com][5],
[cPanel][6],
[FastMail][7],
[Elastic][8],
[ZipRecruiter][9],
[MongoDB][10],
[SureVoIP][11],
[Campus Explorer][12],
[Bytemark][13],
[Infinity Interactive][14],
[OpusVL][15],
[Eligo][16],
[Perl Services][17],
[Oetiker+Partner][18].

 [1]: /wp-content/uploads/2018/04/Screen-Shot-2018-04-27-at-9.35.28-AM-1024x593.png
 [2]: https://www.maxmind.com/en/home
 [3]: https://www.nuugfoundation.no/en/
 [4]: http://www.teknologihuset.no
 [5]: https://www.booking.com
 [6]: https://cpanel.com
 [7]: https://www.fastmail.com
 [8]: https://www.elastic.co
 [9]: https://www.ziprecruiter.com
 [10]: https://www.mongodb.com
 [11]: https://www.surevoip.co.uk
 [12]: https://www.campusexplorer.com
 [13]: https://www.bytemark.co.uk
 [14]: https://www.iinteractive.com
 [15]: http://opusvl.com
 [16]: https://eligo.co.uk
 [17]: https://www.perl-services.de
 [18]: https://www.oetiker.ch
