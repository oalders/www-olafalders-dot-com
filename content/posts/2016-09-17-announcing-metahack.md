---
title: Announcing meta::hack
author: oalders
type: post
date: 2016-09-17T04:30:49+00:00
url: /2016/09/17/announcing-metahack
dsq_thread_id:
  - 5152274110
categories:
  - MetaCPAN

---
Every so often, someone asks if they can donate money to MetaCPAN. I usually direct them to [CPAN Testers][1], since (due to our generous hosting sponsors) we've generally not had a need for money. You can probably see where I'm going with this. Times have changed. We're no longer turning financial sponsors away.

Back at the [QA Hackathon in Rugby][2], we had a great group of hackers together and we got a lot of work done. However, as we worked together, it became clear that the size of our job meant that we wouldn't be able to finish everything we had set out to do over that four day period. There are times when there's no replacement for getting everyone in the same room together.

<center>
  <br /> <a href="https://www.flickr.com/photos/jj_perl/25991401684/in/album-72157667398548526/" title="P4230367.jpg"><img loading="lazy" src="https://c5.staticflickr.com/2/1669/25991401684_7e29da3427_z.jpg" width="640" height="480" alt="P4230367.jpg" /></a><br />
</center>

The first dedicated MetaCPAN hackathon will be held at the offices of [ServerCentral][3]
in Chicago, from November 17th through 20th. The primary goal for this hackathon is to complete MetaCPAN’s transition to [Elasticsearch][4] version 2. This will enable the live service to run on a cluster of machines, greatly improving reliability and performance. The hackathon will also give the core team a chance to plan work for the coming 18 months.

The meta::hack event is a hackathon where we're bringing together key developers to work on the MetaCPAN search engine and API. This will give core team members time to work together to complete the transition to Elasticsearch version 2, and time to discuss gnarly issues and plan the roadmap beyond the v1 upgrade.

MetaCPAN is now one of the key tools in a Perl developer's toolbox, so supporting this event is a great way to support the Perl community and raise your company's profile at the same time. This hackathon is by invitation only. It’s a core group of MetaCPAN hackers. We are keeping the group small in order to maintain focus on the v1 API and maximize the productivity of the group.

## Why sponsor the MetaCPAN Hackathon?

• If your company uses Perl in any way, then your developers almost certainly use MetaCPAN to find CPAN modules, and they probably use other tools that are built on the MetaCPAN API.
• The MetaCPAN upgrade will improve the search engine and the API for all Perl developers. As a critical tool, we need it to be always available, and fast. This upgrade is a key step in that direction.
• This is a good way to establish your company as a friend of Perl, for example if you're hiring.

## Participants

There will be 8 people taking part, including me. Everyone taking part is an experienced senior-level software engineer, and most of them have already spent a lot of time working on MetaCPAN. As noted above, this is an invitational event with a very specific focus.

## What is meta::hack?

MetaCPAN was created in late 2010. Version 0 of the MetaCPAN API was built on a very early version of Elasticsearch. For the first 5 years, most of the work on MetaCPAN focussed on improving the data coverage, and the web interface. In that time Elasticsearch has moved on, and we're now well behind.

The work to upgrade Elasticsearch began in [May of 2014][5]. It continued in early [Feb of 2015][6]. Later, at the 2015 QA Hackathon in Berlin, Clinton Gormley (who works for [Elastic][7]) and I worked on moving MetaCPAN to Elasticsearch version 2. This work was continued [at the 2016 QA Hackathon in Rugby][8], and as a result we now have a beta version in live usage.

The primary goal of meta::hack is to complete the port to Elasticsearch version 2, so the public API and search engine can be switched over. There are a number of benefits:

• Switching from a single server to a cluster of 3 servers, giving a more reliable service and improved performance.
• Once we decommission the old service, we’ll be able to set up a second cluster of 3 machines in a second data centre, for further improvements.
• We’ll be able to take advantage of new Elasticsearch features, like search suggesters.
• We’ll be able to use a new endpoint that has been developed specifically to speed up cpanminus lookups. Cpanminus is probably the most widely used CPAN client these days, so improving this will benefit a large percentage of the community.
• If and when search.cpan.org is decommissioned, we’ll be able to handle the extra traffic that will bring with it, and we’ll also have the redundancy to do this safely.
• We’ll be able to shift focus back to bug fixes and new MetaCPAN features.

## Becoming a Sponsor

Neil Bowers has kindly taken on the task of shepherding the sponsorship process.  (He also wrote the sponsorship prospectus from which I cribbed most of this post.) Please [contact Neil][9] or [contact me][10] for a copy of the meta::hack sponsorship prospectus.  It contains most of the information listed above as well as the various available sponsorship levels which are available.  Thank you for your help in making this event happen.  We're looking forward to getting the key people together in one room again and making this already useful tool even better.

 [1]: https://members.enlightenedperl.org/drupal/donate-cpan-testers
 [2]: http://blogs.perl.org/users/neilb/2016/05/the-qa-hackathon-2016-was-a-great-success.html
 [3]: https://www.servercentral.com/
 [4]: https://www.elastic.co/products/elasticsearch
 [5]: https://github.com/metacpan/metacpan-api/pull/312
 [6]: https://github.com/metacpan/metacpan-api/pull/398
 [7]: https://www.elastic.co/
 [8]: https://github.com/metacpan/metacpan-api/pull/448
 [9]: https://metacpan.org/author/NEILB
 [10]: https://metacpan.org/author/OALDERS
