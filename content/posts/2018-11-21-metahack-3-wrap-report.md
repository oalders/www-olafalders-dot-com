---
title: meta::hack 3 Wrap Report
author: oalders
type: post
date: 2018-11-21T17:30:14+00:00
url: /2018/11/21/metahack-3-wrap-report
categories:
  - MetaCPAN
  - Perl
  - Programming

---
As I mentioned in [my meta::hack preview post][1], for the third year running we have had the privilege of being financially sponsored by [Booking.com][2] and also working out of the [ServerCentral][3] offices in downtown Chicago in order to hack on [MetaCPAN][4]. None of this would have been possible without the support of [Mark Keating][5] and the [Enlightened Perl Organization][6]. Mark has (as usual) worked tirelessly to ensure that sponsor money moves in the right directions so that we are able to fund meta::hack every year. We are extremely grateful for his help.

I'd also like to thank [MaxMind][7] (my employer) for supporting me in attending this event.

This year, five of us worked on improving our corner of the Perl ecosystem.

## The Attendee List

  * [Doug Bell][8]
  * [Joel Berger][9]
  * [Olaf Alders][10]
  * [Mickey Nasriachi][11]
  * [Shawn Sorichetti][12]

## Getting There

We all had a great time this year. It's always nice to spend time with friends and it's great to see pet projects move ahead. Shawn and I flew in from Toronto on the Wednesday afternoon and had lunch at a German restaurant.

![](/wp-content/uploads/2018/11/IMG_2298-768x1024.jpg)

![](/wp-content/uploads/2018/11/IMG_2299-1024x768.jpg)

Mickey arrived from Amsterdam a little later in the day. The three of us met up with Doug for drinks and dinner in the evening.

![](/wp-content/uploads/2018/11/IMG_2305-768x1024.jpg)

![](/wp-content/uploads/2018/11/IMG_2308-1024x768.jpg)

## Getting Started

On Thursday morning, Mickey, Shawn and I got up early and got a run in before heading to the office. We ran along the water and through Millenium Park, stopping off at "the bean" to take pictures and have a look around. That was a very nice, if chilly, way to start the day.

![](/wp-content/uploads/2018/11/Screen-Shot-2018-11-21-at-11.02.28-AM-1024x646.png)

Right from day one we had a productive time. We started by discussing what needed to be done vs what we wanted to do and I think we got some combination of these things done. From my personal experience, I think the trick is to have people generally work on the things they find interesting, while also spending some time on the things that just need to get done. I think we found a good balance. Now, rather than give a chronology of the event, I'm going to cover our "greatest hits" for the event.

## The Highlights

  * It turns out our CPAN mirrors were not in sync, causing some hard to debug errors. This got fixed.
  * We removed an unused and undocumented endpoint from the api (`/search/simple`)
  * [FastMail][18] came on board as a sponsor. As of this week they are handling our mailboxes. Many thanks to them and to [https://metacpan.org/author/RJBS][19] for getting us up and running in a hurry.
  * We are now equipped to delete CPAN authors and releases from MetaCPAN. Previously this was non-trivial, but we can now deal with spammy modules, authors and other issues which require uploads and or data to be removed.
  * The caching on our Travis CI API tests had stopped working, so we fixed this.
  * Our `changes` endpoint on the API now recognizes more types of Changes files. The means the search site will now more easily be able to help you find Changes files when you need them.
  * There were previously some cases where the API returned a non-unique list of modules in the `provides` output. This has now been fixed moving forward. If you spot a module which needs to be re-indexed, let us know and we can do this.
  * The search site now includes links to [cpancover.com][20] in cases where coverage reports are available. I hope this will bring more visibility to [cpancover.com][20] and also be useful to authors and users of CPAN modules. You'll now more easily to be able to find [Devel::Cover][21] output for your favourite modules.
  * The [/lab/dashboard][22] endpoint of the search site has been broken for a long time. The exception was fixed and regression tests have been added. The content of the page is still mostly broken, but that can be fixed moving forward.
  * A Minion UI has been added for admins, so that we can now view the status of the indexing queue via a web browser
  * More endpoints have been documented. We have done this using OpenAPI. You can view the beginnings of it at [fastapi.metacpan.org/static/index.html][23].
  * We have partially implemented a user search for admins. This will allow us more easily to troubleshoot issues with users logging in or adding PAUSE, github and other identities to their MetaCPAN logins. Also this will soon help us to identify issues with users who are not seeing all of their favourite modules listed.
  * We have partially implemented an admin endpoint for adding CPAN releases for re-indexing. We currently do this at the command line. Having a browser view for this means we can do this without requiring SSH. More importantly, we'll eventually be able to make this available to end users of MetaCPAN so that people can request re-indexing of releases they care about.

That's the bulk of what we got done. I haven't even listed the work that Doug got done on CPANTesters, mostly because I stayed out of his way and I just don't have the details. Doug was a gracious host. In addition to helping make sure that we got fed and got into the office when we needed it, he stayed late with us on those evenings when we just didn't want to leave and was back again early the next morning. We should also thank Joel Berger who also helped to host us during our stay. Working out of the ServerCentral offices for the third year in a row has been really great. We know our way around and we've been treated extremely well. It was a real treat to be allowed back.

![](/wp-content/uploads/2018/11/IMG_2327-1024x768.jpg)
![](/wp-content/uploads/2018/11/IMG_2328-2-768x1024.jpg)


Joel was not able to join us onsite on the weekend, but he did join us on screen.

![](/wp-content/uploads/2018/11/IMG_2391-1-1024x768.jpg)


## Other Fun Stuff

Aside from getting our work done, we got in a bike ride on Friday morning. It was snowing and quite windy along the water where we rode. I lost most of the feeling in my hands. In future I'll either pack warmer gloves or exercise better judgement. Obviously I can't count on the others to talk me out of bad ideas. 😉

We also got in more runs on Saturday and Sunday morning. So, while we spent a lot of time sitting in the office, putting calories into our bodies, we did get exercise every day of the conference. That really helped me be productive during the day.

![](/wp-content/uploads/2018/11/IMG_2414-1024x768.jpg)

Evenings were fun as well. We had drinks on the 96th floor of the Hancock Building, visited the Chicago Institute of Art and Mickey and I went to a Bulls game on Saturday night. There was only one night where everyone else was too tired to go out. I got myself a table for one at the hotel bar. _Wipes tears from eyes_. (That was actually not a bad experience either.)

![](/wp-content/uploads/2018/11/IMG_2375-768x1024.jpg)
![](/wp-content/uploads/2018/11/IMG_2402-1024x768.jpg)

## In Conclusion

Our Sunday deployment was a bit of a bumpy ride. In retrospect I would have preferred less moving parts to be involved in a single deployment, but it was also interesting to debug the deployment in real time with a few of us troubleshooting via a 60 inch screen.

![](/wp-content/uploads/2018/11/IMG_2418-1024x768.jpg)

We left Doug behind in the office, with what was left of his TODO list.

![](/wp-content/uploads/2018/11/IMG_2419-768x1024.jpg)


The flight home was uneventful. There were still some deployment issues to sort out on Monday but those eventually got taken care of.

![](/wp-content/uploads/2018/11/IMG_2424-1024x768.jpg)

Several of our usual attendees were not able to make it this year and we really missed them. On the whole however, I was quite happy with what we accomplished this time around. Moving forward we'll be able to continue to build on the work done during meta::hack and continue to improve MetaCPAN.
