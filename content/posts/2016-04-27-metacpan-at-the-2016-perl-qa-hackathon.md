---
title: MetaCPAN at the 2016 Perl QA Hackathon
author: oalders
type: post
date: 2016-04-27T03:41:41+00:00
url: /2016-04-27-metacpan-at-the-2016-perl-qa-hackathon
dsq_thread_id:
  - 4780779076
categories:
  - MetaCPAN

---
## Before I start, I'd like to thank our sponsors

This year I once again had the pleasure of attending my 4th Perl QA Hackathon. Before I get into any details, I'd like to thank the organizers: [Neil Bowers](https://metacpan.org/author/NEILB), [Barbie](https://metacpan.org/author/BARBIE) and [JJ Allen][1]. They did a fantastic job. It was a very well organized event and really a lot of fun. It was well worth attending and it made a huge difference to the [MetaCPAN][2] project.  Thanks also to Wendy for making sure that everyone had what they needed.

Lastly, I'd like to thank all of the sponsors who made this event possible. These companies and individuals understand what makes the QA Hackathon such an important event and I'm happy that they wanted to help make it happen.

  * [FastMail][3]
  * [ActiveState][4]
  * [ZipRecruiter][5]
  * [Strato][6]
  * [SureVoIP][7]
  * [CV-Library][8]
  * [OpusVL][9]
  * [thinkproject!][10]
  * [MongoDB][11]
  * [Infinity][12]
  * [Dreamhost][13]
  * [Campus Explorer][14]
  * [Perl 6][15]
  * [Perl Careers][16]
  * [Evozon][17]
  * [Booking][18]
  * [Eligo][19]
  * [Oetiker+Partner][20]
  * [CAPSiDE][21]
  * [Perl Services][22]
  * [Procura][23]
  * [Constructor.io][24]
  * [Robbie Bow][25]
  * [Ron Savage][26]
  * [Charlie Gonzalez][27]
  * [Justin Cook][28]

## The Crew

My focus this year (as always) was working on MetaCPAN, but this time around I had much more help than usual. [Leo Lapworth][29] joined us from London for the first two days, working on the sysadmin side. [Mickey Nasriachi][30] came in from Amsterdam to work with us on the back end code. [Matt Trout][31] spent a lot of his time helping us with debugging and database replication. [Sawyer][32] spent a great deal of his time pair programming with us and helping us debug some really thorny issues. Also, what began as a conversation with [Joel Berger][33] about a simple MetaCPAN patch resulted in him spending much of his time looking at various issues. He now has a solid understanding of the MetaCPAN stack and we hope he can continue to contribute as we move forward.

We had a really good crew and we were all quite focussed. We removed ourselves from the main hackathon room so that we were able to have our own conversations and be less subject to distracting conversations from other groups. Since we were just outside of the main room we were able to talk with various others as they passed by our table. It was like having a space to ourselves, but we still felt very much a part of the hackathon.

Our main goal was to upgrade MetaCPAN from Elasticsearch 0.20.2 to 2.3.0 I spent a lot of time on this with [Clinton Gormley][34] at last year's hackathon. The upgrade at that time was planned to be a 0.20.2 to a 1.x version. We were optimistic, but it became clear that it was a job that we couldn't realistically finish. So, we left last year's hackathon with some good changes, but we weren't close to being able to deploy them. By this year, Elasticsearch had introduced even more breaking changes as it moved from 1.x to 2.x, so we had to factor those in as well.

For 2016, in the weeks coming up to the hackathon, Leo and I had been pushing a lot of code in preparation for this weekend. Around the same time, Mickey arrived on the scene and really moved things forward with his code changes too. So, we had a small core of developers working on the code well in advance of the hackathon. That's actually one of the nice things about an event like this. I didn't just write code when I got here. Having a firm date by which a number of things had to be done forced me to sit down and solve various problems in the weeks leading up to hackathon.

## What did we actually get done?

### Elasticsearch Cluster

One criticism of MetaCPAN has been a lack of redundancy. We've had a good amount of hardware available to us for some time, but we haven't had a really good way to take advantage of it. Thanks to some of the work leading up to the hackathon, v1 of the API will run on an Elasticsearch cluster of 3 machines (rather than the 1 currently on production box, which is v0). Having a proper cluster at our disposal should make for faster searching and also greater redundancy if one of these machines needs to take an unscheduled break. On the human side, it will be a lot less stressful to lose one machine on a cluster of three than to lose one machine on a cluster of one. We all know these things happen. It's just a matter of time. So, we'll be better prepared for when a machine goes down.

### Minion

Occasionally we need to re-index everything on CPAN. This takes a very long time. The current incarnation of MetaCPAN (v0) uses a script to do this and it can take 12 hours or more to run. If that script runs into some unhandled exception along the way, you have the rare pleasure of starting it up again manually. It needs some babysitting and it's far from bulletproof. It's also a bit hard to scale it.

Rather than trying to speed up our current system, we've added a Minion queue to our setup. This means that when we re-index CPAN, we add each upload as an item in our queue. We can then start workers on various boxes on the same network and we can run indexing in parallel. In our experiments we ran 17 workers each on 3 different boxes, giving us 51 workers in total. This gives us more speed and also more insight into which jobs have failed, how far along we are with indexing etc. It's a huge improvement for us.

### Postgres

Minion has more than one possible back end. We've chosen to go with Postgres. This means that we now have Postgres installed for the first time and also available for other uses. Matt Trout has been working on Postgres replication for us so that we have some redundancy for our queues as well. Once that is available, he can also write a Pg schema which MetaCPAN can use as part of the back end. This means that at some future date we could begin to store our data in both Pg and Elasticsearch. This would give us a hybrid approach, allowing us to use Elasticsearch for the things it does well and a relational database for the kinds of queries which a NoSQL store doesn't handle well or at all in some cases.

As a historical footnote, the original version of the API first inserted into an SQLite database and then dumped that data into Elasticsearch. We may eventually come full circle and use a similar approach with Postgres.

### RAM Disk

As part of Leo's sysadmin work, he has set up a RAM disk for the indexer to use when unpacking tarballs. Even if this only saves a fraction of a second per archive, when you're indexing 500,000 archives, even a small savings of time can be a win.

### Elasticsearch Upgrade

Currently production runs on Elasticsearch version 0.20.2.  Our work this weekend has pushed us to using 2.3.0. Part of what has been holding us back is the many breaking changes which are involved in this particular upgrade. Much of our efforts at the hackathon were directed towards dealing with these various breaking changes. We haven't quite tackled all of them yet, but we're very close.

### Deploying and Indexing a Beta Cluster

We now have a cluster of machines running our v1 beta.  I will publish the URLs as soon as we are ready for feedback.

Please note that our API versioning does not follow the Elasticsearch versioning. This frees us up to change API endpoints etc outside of the scope of another Elasticsearch upgrade.

### CPAN River Integration

Joel Berger [submitted a patch][35] to integrate CPAN River statistics into the /distribution endpoint. The actual data will be provided by Neil Bowers. The patch to add this data to the /distribution endpoint has already been merged to the v1 branch and there has been [some work done by Barbara][36] to work on a front end display for the data.

### CPANCover.com Integration

I had a chance to speak with [Paul Johnson][37] about [cpancover.com][38] I had initially put together an integration for his site 2 years ago at the QA Hackathon. I thought the integration was fine, but I ran into enough resistance from the MetaCPAN team that this pull request was never merged. We've now agreed on a way to move forward with this which will make everybody happy. There are open tickets on both the front and back end of MetaCPAN to address this.

### Debian Packaging Information

Book is working on adding some information which can be used to correlate modules with their corresponding Debian packages. Once this is finished, this data can also be added to the distribution endpoint. The integration itself is pretty simple and will work much like the CPAN River.

### Changes files

Graham Knopf wasn't able to attend the QA Hackathon, but he did spend some time hacking from home. He has a patch in to [alter how changes files are displayed][39].

### Moving Towards Test2::Harness

I spoke with [Chad Granum][40] on the evening before the hackathon and I mentioned that we were using [Test::Aggregate][41], one of the few distributions which was not yet playing nicely with Test2. I wasn't too worried about this since we pin our dependencies via Carton but also because I'd been hoping to move away from it. I had been thinking about [Test::Class::Moose](https://metacpan.org/pod/Test::Class::Moose) as an alternative, but I didn't want to go to the trouble of setting up test runners etc. Something simpler would be nice. Chad showed me Test2::Harness, which would give us the same advantages of running under Test::Aggregate. It looks great and should be available shortly. In the meantime I've gutted the Test::Aggregate logic from the tests and we're running everything the old fashioned (slower) way for the time being. A switch to Test2::Harness in the near future should be trivial.

### MetaCPAN::Moose

As part of our general cleanup, I released [MetaCPAN::Moose][42]. This is a simple bit of code which imports [MooseX::StrictConstructor](https://metacpan.org/pod/MooseX::StrictConstructor) and [namespace::autoclean](https://metacpan.org/pod/namespace::autoclean) into any class which uses it. After writing the code and the tests, I showed it to Sawyer. He sat down and immediately rewrote it using Import::Into. The code was now at least 50% smaller than it previously was and it was a lot cleaner. The tests continued to pass, so I was happy to release that to CPAN.

Moving forward we're going to publish a few more of our internal modules to CPAN. These will serve several purposes:

  * It will be useful to us as a way of sharing code between various apps which we have. We use Carton to manage various app installs, so sharing code can be tricky. We didn't want to go the submodule route unless we really have to.
  * Some people may also find this code useful. It's a good way to showcase our logic as a way of doing things (like setting up your own custom Moose type library). People could learn from it.
  * Alternatively, people might look at it and realize it's terrible. At this point they'll hopefully hack on it and send pull requests. Because this code is standalone with its own test suite, the overhead of getting started will be much, much less than it is for hacking on the rest of CPAN.

I don't think generally publishing internal logic to CPAN is a good idea, but for the above stated reasons, I think the code that we are talking about is well suited for this.

### CPANTesters Data

We used to import CPAN Testers data into MetaCPAN using an SQLite database which they provided. At some point this database became unavailable. I'm encouraged to hear that this may not be a permanent state of affairs. If something can be worked out, the MetaCPAN can once again easily import testers data into its API using the database.

Somewhere out there I can hear someone complaining that this isn't RESTful or whatever, but for this amount of data involved, it's actually a good fit. I did discuss with Doug what a REST API for this might look like, but to be honest, that would potentially be much more work than just creating the database on some arbitrary schedule and publishing it.

### Interesting Things I Learned From Random Conversations:

  * Matt Trout suggests abandoning [MooseX::Types](https://metacpan.org/pod/MooseX::Types) and moving our type checking to [Type::Tiny](https://metacpan.org/pod/Type::Tiny). I'm on board with that, but it's not a priority right now.
  * I learned from Sawyer that a simple speed optimization is switching to a Perl which is compiled without taint. Also he recommended some XS modules for header and cookie handling. The XS part wasn't news to me, but it's something I'll keep in mind for future and certainly something I can make sure we do with MetaCPAN. 
    Edit and caveat: As far as compiling Perl without taint mode goes, Sawyer was kind enough to refer me to some relevant p5p messages: [http://nntp.perl.org/group/perl.perl5.porters/193822](http://nntp.perl.org/group/perl.perl5.porters/193822) <http://nntp.perl.org/group/perl.perl5.porters/194361> Apparently there is **some** performance to be gained, but whether or not it's worthwhile for you likely depends very much on the behaviour of your application. </li> 
    
      * I heard (once again) that [Devel::Confess](https://metacpan.org/pod/Devel::Confess) is a "better" tool for debugging. I've been using it for a while now and am very happy with it. I'm not the only one.
      * From Mickey, I learned about [Devel::QuickCover][43], which sounds like an interesting way to get a first pass at coverage data.
      * I now know how to pronounce [Upasana][44].
      * I learned that I'm not the only person who has no clue how to read a flame graph.
      * After a lengthy conversation with Matt Trout on the Thursday it wasn't until I said, "hang on, I'll send you the link on IRC" that he looked at his screen and then looked back up and said, "oh, **that's** who you are". I guess I could have introduced myself formally when he first sat down, but eventually we got there.
      * After seeing the [Roost laptop stand][45] in action, I think I need one.</ul> 
    
    ### Unrelated to MetaCPAN
    
    Karen Etheridge was able to merge my fix to allow [MooseX::Getopt](https://metacpan.org/pod/MooseX::Getopt) to play nicely with init_arg. It's a bug that has bitten me on more than one occasion. The fix has now been released.
    
    After a conversation with [BINGOS][46] on [Sort::Naturally](https://metacpan.org/pod/Sort::Naturally), he got me co-maint on that module so that I can look at addressing an outstanding issue.
    
    ## In Conclusion
    
    For me, it was a great few days for moving the project along and socially quite fun. I got to see a bit of London on my arrival and spend a few hours at the British Museum, which I last visited about 20 years ago. In the afternoon, Leo was kind enough to drive me up to Rugby. Leo, Mickey and Joel were among the people whom I have spoken with on IRC but had never met in person. Making those real life connections is great.
    
    On a practical level, I mostly started looking the correct way when crossing the street, but I wouldn't bet anyone else's safety on my ability to do the right thing there. Most of my ride from the airport to Leo's office consisted of me feeling quite sick to my stomach as part of me really wanted the driver to switch to the <del>correct</del> right side of the road. London rush hour traffic and narrow streets with two way traffic probably didn't help.
    
    It was nice to see [RJBS][47] get a special show of thanks for his years as pumpking and also to witness the passing of the torch to Sawyer, who will do a fantastic job as he takes over. Also the tradition of publicly thanking the organizers has continued, which is a nice part of the weekend.
    
    I should mention that this year there were no special outings. No video game museum tours, no chance to see how Chartreuse is made. Not even a trip to the set of Downton Abbey. That meant a few extra hours of hacking, bug squashing etc, which is nice too. I'm sure that deep down inside Neil really wanted to take us to a filming of Coronation Street, but he resisted the urge in order to further the goal of productivity.
    
    All in all, I felt it was an extremely productive week for me and for MetaCPAN in general. My sincere thanks go out to the gang for having had me along once again this year.

 [1]: https://metacpan.org/author/JONALLEN
 [2]: https://metacpan.org
 [3]: https://www.fastmail.com
 [4]: http://www.activestate.com
 [5]: https://www.ziprecruiter.com
 [6]: https://www.strato.com
 [7]: http://www.surevoip.co.uk
 [8]: http://www.cv-library.co.uk
 [9]: http://opusvl.com
 [10]: https://www.thinkproject.com
 [11]: https://www.mongodb.com
 [12]: https://www.iinteractive.com/
 [13]: https://www.dreamhost.com/
 [14]: http://www.campusexplorer.com
 [15]: http://www.perl6.org/
 [16]: https://opensource.careers/perl-careers/
 [17]: https://www.evozon.com/
 [18]: http://www.booking.com
 [19]: eligo.co.uk
 [20]: http://www.oetiker.ch/
 [21]: http://capside.com/en/
 [22]: http://www.perl-services.de/
 [23]: https://www.procura.nl/
 [24]: https://constructor.io/
 [25]: https://metacpan.org/author/BABF
 [26]: https://metacpan.org/author/RSAVAGE
 [27]: https://metacpan.org/author/ITCHARLIE
 [28]: https://twitter.com/jscook2345
 [29]: https://metacpan.org/author/LLAP
 [30]: https://metacpan.org/author/MICKEY
 [31]: https://metacpan.org/author/MSTROUT
 [32]: https://metacpan.org/author/XSAWYERX
 [33]: https://metacpan.org/author/JBERGER
 [34]: https://metacpan.org/author/DRTECH
 [35]: https://github.com/CPAN-API/cpan-api/pull/462
 [36]: https://github.com/CPAN-API/metacpan-web/issues/1679
 [37]: https://metacpan.org/author/PJCJ
 [38]: http://cpancover.com
 [39]: https://github.com/CPAN-API/metacpan-web/pull/1680
 [40]: https://metacpan.org/author/EXODIST
 [41]: https://metacpan.org/pod/Test::Aggregate
 [42]: https://metacpan.org/pod/MetaCPAN::Moose
 [43]: https://metacpan.org/pod/Devel::QuickCover
 [44]: https://metacpan.org/author/SWEETKID
 [45]: https://www.therooststand.com/
 [46]: https://metacpan.org/author/BINGOS
 [47]: https://metacpan.org/author/RJBS
