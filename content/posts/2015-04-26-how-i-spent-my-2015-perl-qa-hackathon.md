---
title: How I Spent My 2015 Perl QA Hackathon
author: oalders
type: post
date: 2015-04-26T17:22:10+00:00
url: /2015-04-26-how-i-spent-my-2015-perl-qa-hackathon
dsq_thread_id:
  - 3715590933
categories:
  - MetaCPAN
  - Perl
  - Programming

---
One week ago I was in Berlin at the Perl Quality Assurance Hackathon (QAH), happily hacking away on MetaCPAN. Today I'll summarize the good, the bad and the ugly about my time in Berlin. Spoiler alert: it was all good.

This was the third year that I've been able to attend the QAH. I was previously in Paris and Lyon. From my past years, I knew that I'd have some serious time to put my head down and get some work done. I didn't make an overly ambitious TODO list, since there's one main project for MetaCPAN right now: upgrading from Elasticsearch 0.20.2 to 1.5.0 It's a big jump with a number of breaking changes. MetaCPAN has a pretty big stack and a lot of lines of code. It also relies on ElasticSearchX::Model as an abstraction, which needed some work for this upgrade as well. So, I figured I'd put some effort into this and work on a few other things as they came up.

My hackathon always begins at YYZ [insert joke about [Rush][1]] and continues on the flight in. I generally get a lot of work done in this phase rather than getting sucked into just watching bad movies. (Don't get me wrong, I truly enjoy a bad movie, but I also rarely get a big block of time to move things forward with my open source projects).

On the flight I decided to get some smaller things out of the way, mostly not directly related to MetaCPAN. I wasn't able to release anything from the air, so I'll summarize those as part of my hackathon Day 1.

In addition to the code I wrote on the plane, I wrote a couple of blog posts to thank new MetaCPAN sponsors. I have 3 outstanding posts and I was able to write 2 of them on the plane. You'll see those shortly. I'll post them individually once all of the QAH blog posting dies down.

## The Day Before

I flew out on Tuesday and arrived early on Wednesday morning.  I was at the hotel by 9 AM, but the room wasn't available until 3 PM, so I ditched by bags and headed out on the town.  I had decided to fly only with enough clothing to get me through day one, so one of my first tasks was to find something to wear.  That was actually a lot of fun.  One of my favourite moments was when I told a salesperson that I was looking for a medium sized shirt.  Without skipping a beat he said, "you'll need a large."  He was right.  I'm sure there was no judgement implied!

In the evening I got to meet (for the first time) a couple of folks whom I've worked with on MetaCPAN since the very beginning.  [Johannes Plunien](https://metacpan.org/author/PLU), the creator of [GitHub Meets CPAN](http://gh.metacpan.org/) happens to live in Berlin.  He hadn't been planning to attend the hackathon, but was free to hang out in the evening, so he came by the hotel.  Next [Clinton Gormley](https://metacpan.org/author/DRTECH), one of the authors of  [Elasticsearch: The Definitive Guide](http://shop.oreilly.com/product/0636920028505.do) came by the hotel as well.  He was in town for the hackathon, having been sponsored by [Elastic](https://www.elastic.co/) to attend.  I knew he was tall, but I wasn't quite prepared for how he would tower over me.  It's a good thing he's a friendly giant!  Next [Neil Bowers](https://metacpan.org/author/NEILB) showed up and we all joined the others for dinner.  For me this is a good illustration of how hackathons are helpful beyond just getting things done.  It was really great for me to get to know Johannes and Clint in person.  It's also nice to have Neil around, since he speaks the Queen's English.

&nbsp;

<h2 style="text-align: center;">
  Day One (Thursday)
</h2>

&nbsp;

  * On the airplane [I had written some code for Plack](https://github.com/plack/Plack/pull/507) which allows it to use [Cookie::Baker](https://metacpan.org/pod/Cookie::Baker) in [Plack::Request](https://metacpan.org/pod/Plack::Request). I had actually proposed to send this pull request back in November 2014 and it had kind of been hanging over my head that I hadn't gotten to it. [MIYAGAWA][2] merged it on Day 1. It shrinks Plack::Request by 34 lines.
  * I [merged a MetaCPAN pull request](https://github.com/CPAN-API/metacpan-web/pull/1484) which adds boilerplate installation instructions for modules to the left sidebar of module and distribution pages. (You'll find it under "PERMALINKS"). Once this was merged we found some issues related to the changes and after a few iterations I had those cleaned up and deployed to production.
  * I [added JS beautification](https://github.com/CPAN-API/metacpan-web/commit/dcc3d4954bff629e2d6579f1efa79866789e3209) to MetaCPAN. We already tidy our Perl code automatically. This keeps our JS looking spiffy as well.
  * On the plane I basically finished up a proof of concept I had been working on in order to showcase [HTTP::BrowserDetect](https://metacpan.org/pod/HTTP::BrowserDetect). In the evening back at the hotel I registered a domain name and launched [BrowserDetect.org](http://www.browserdetect.org/) I had been toying with making this a web service so that you could use it for robot detection etc, but I opted for a Minimum Viable Product to start with here.
  * I merged a bug fix for [WWW::Mechanize::Cached](https://metacpan.org/pod/WWW::Mechanize::Cached) and released a new version.
  * I realized that I had some unreleased changes in [WWW::RoboCop](https://metacpan.org/pod/WWW::RoboCop), so I released a new version of that and also fixed a test dependency and then re-released.
  * On the airplane I had made two big improvements to [LWP::ConsoleLogger](https://metacpan.org/pod/LWP::ConsoleLogger). First, I had converted it from [Moose](https://metacpan.org/pod/Moose) to [Moo](https://metacpan.org/pod/Moo), which means that I now have the option of adding it as a proper dependency to [GitHub::MergeVelocity](https://metacpan.org/pod/github-mergevelocity) without pulling in all of Moose. I also began using [HTTP::Body](https://metacpan.org/pod/HTTP::Body) to parse POST params. ([What I had been doing before](https://metacpan.org/source/OALDERS/LWP-ConsoleLogger-0.000014/lib/LWP/ConsoleLogger.pm#L201) to parse POST params did work, but it made me sad.) I released a new LWP::ConsoleLogger with these improvements.
  * In addition to all of this, I worked with Clinton Gormley on the Elasticsearch upgrade.  That is, he did the bulk of that work and I helped him with issues specific to MetaCPAN.

&nbsp;

<h2 style="text-align: center;">
  Day Two (Friday)
</h2>

&nbsp;

  * I [merged my own pull request](https://github.com/CPAN-API/cpan-api/commit/1e0dcaf7a1e77be6ee248242c382f4ff0c52a3e8) which had begun on the airplane, where I had written some code to remove MetaCPAN's Pod generation out of the Catalyst controller.  This makes it easier to test.  Also, this will allow us in future to accept an arbitrary base URL for Pod generation via the API. This means that if you are generating Pod but don't want it to link back to MetaCPAN, you'll be able to provide your own URL for the Pod generation.  This also something we'll be able to use on the MetaCPAN search site when developing locally.  Right now Pod links bounce you from your development site to the production site, which is really confusing.  This part is not yet implemented, but it should be fairly trivial to implement.
  * I continued to work with Clinton Gormley on his Elasticsearch improvements
  * I fixed an issue with permissions on the MetaCPAN production machines.  This allows us to run many commands without having to su to another user first, which is quite helpful.
  * I released a new [ElasticSearchX::Model](https://metacpan.org/pod/ElasticSearchX::Model)  This included some of Clinton's improvements as well as a few changes which were required to keep up with changes in [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) plugins.
  * I spent some time improving the tests for the MetaCPAN API
  * I patched MetaCPAN.org to recognize more extensions which are commonly used for markdown.  This will make more README files easier to find.
  * I also spent some time working with [CPAN::Faker](https://metacpan.org/pod/CPAN::Faker) to add some tests for a new endpoint which Clinton was creating after a conversation with MIYAGAWA.  This will be used by [cpanm](https://metacpan.org/pod/cpanm) and will simplify its internals once it is finished.  Essentially cpanm builds a complex API query to find the correct download URL for modules under various conditions.  We've decided to move this logic directly into the MetaCPAN API.  This will remove a fair chunk of logic from cpanm and will also make this new endpoint available to anyone else who wishes to use it.  That's a big win.

&nbsp;

<h2 style="text-align: center;">
  Day Three (Saturday)
</h2>

&nbsp;

  * I [fixed a bug](https://github.com/CPAN-API/p5-elasticsearch-model/commit/7e2f9064559c42efcb57249e4c97dd6be3a7caa2) in [ElasticSearchX::Model](https://metacpan.org/pod/ElasticSearchX::Model) which was particularly hard to debug.  It was throwing an exception in a DEMOLISH sub.  The problem with throwing exception at object teardown is that you have no guarantee of which classes are still available.  As a result, Moose was trying to inflate an exception to a class which was no longer available.  That, in turn, triggers a new exception which triggers a new exception which &#8230; (well, you can see where I'm going from here).  Basically hilarity ensues.  I was happy to get that sorted and released.
  * Based on my work with CPAN::Faker on Day two, I came to the conclusion that it wasn't going to be a solution for all of our problems.  Possibly it could be, but not without a lot of effort, since it wants you to mock up CPAN distributions.  I had been spending time running the MetaCPAN indexer on a staging machine using the latest Elasticsearch and I was watching real tarballs trigger exceptions in our code.  I didn't want to have to find the problems with those tarballs and then mock them up using CPAN::Faker, mostly because I'm lazy.  (This is not strictly a virtue of programming.  I'm pretty sure I was born lazy.)  So, I reworked the API tests to create a CPAN of arbitrary size using [OrePAN2](https://metacpan.org/pod/OrePAN2).  This now allows us to add any problematic tarballs to our test suite (but not to our Git repository).  This will make regression testing much easier.  It has already made my debugging incredibly easier.
  * This was also Clinton's last day at the hackathon.  He did an incredible amount of work to move the upgrade forward and he also very graciously gave a presentation on Elasticsearch's query language which makes it much easier to understand.  I would list off all of Clint's accomplishments but that would make this blog post ridiculously long, if it isn't already.

&nbsp;

<h2 style="text-align: center;">
  Day Four (Sunday)
</h2>

&nbsp;

  * As part of my work on the API's test suite, I ended up releasing [Git::Helpers](https://metacpan.org/pod/Git::Helpers).  The name is misleading since there is currently only one helper (oops!) but I actually do plan to add more.
  * The MetaCPAN API was getting pummelled over the time I was there.  I did some troubleshooting to find which IPs and UserAgents were occurring most in our log files.  I put those in a newly created [metacpan-sysadmin](https://github.com/CPAN-API/metacpan-sysadmin) repository.
  * As part of my work to add an arbitrary CPAN to the API tests, I came across a bug in [CPAN::Repository](https://metacpan.org/pod/CPAN::Repository).  I had wanted something to write an 06perms file and had casually mentioned this to Neil Bowers.  He had suggested this module.  I raised a ticket about the issue and [GETTY](https://metacpan.org/author/GETTY) immediately gave me co-maint and added me as a collaborator on the GitHub repository.  I've now patched this particular bug and have released a new version of the module.
  * After having dinner with [PLU](https://metacpan.org/author/PLU) earlier in the week, we had convinced him to visit the hackathon on the weekend.  He graciously came by on the Sunday and worked like a machine.  By the time he had left, [he had sent 4 pull requests for metacpan.org](https://github.com/CPAN-API/metacpan-web/pulls?utf8=%E2%9C%93&q=is%3Apr+is%3Aclosed+author%3Aplu+created%3A%3E2015-04-01)  The most notable of these pull requests is that we now have keyboard shortcuts, which I have wanted for a very long time.  Type "?" on a module page, for instance, to see what you can now do.  The shortcuts will be revised again shortly, so don't get too attached to all of them, but this is going to make your MetaCPAN browsing much, much easier.
  * I was able to merge and deploy all of PLU's commits on the Sunday

&nbsp;

<h1 style="text-align: center;">
  The Day After (Monday)
</h1>

&nbsp;

  * I got to the airport way too early, so I had a couple of hours to keep working.  I continued to refactor the API tests.  I also worked a bit on the download_url tests which Clinton Gormley had created for the new cpanm endpoint.  As part of my work I added some more documentation to the API as well.
  * I also looked into [an issue with OrePAN2, which makes it hard to inject developer releases into your local DarkPAN](https://github.com/tokuhirom/OrePAN2/pull/36).  This actually took up a bunch of my time as I had to poke around in [Parse::PMFile](https://metacpan.org/pod/Parse::PMFile) as well as [Parse::LocalDistribution](https://metacpan.org/pod/Parse::LocalDistribution).  [ISHIGAKI](https://metacpan.org/author/ISHIGAKI) has kindly worked through some of these issues with me.  As a result, I think we have a good solution and that should be implemented and released short.
  * I continued to poke at the test suite and various little things on the plane until I was exhausted enough that all I could reasonably do was watch a bad movie.

&nbsp;

<h2 style="text-align: center;">
  What I Didn't Do
</h2>

&nbsp;

We didn't manage to finish the Elasticsearch migration, but that's OK.  Collectively there was a huge amount of work on this which got finished.  It was probably not realistic to think this would have been done over 4 days, especially given that MetaCPAN is a service which is heavily used in production.  Now that we're out of beta, we can't just push stuff out to production and hope that it doesn't break too badly.

If you've read other hackathon reports, you'll have read about all of the discussions around CPAN which took place.  I made a conscious decision not to participate in these discussions because a) I needed the time to work on MetaCPAN and b) there were other people who have thought much more about these things than I have.  I trust them to make the right decisions and from what I understand, they made a lot of progress.

Socially, there are a lot of people at the hackathon that I didn't really connect with.  I had some good conversations with various people, but I did spend a lot of time with headphones on trying to get this or that sorted.  That was a conscious decision as well.  I tried to be available to anyone who had MetaCPAN questions but I also had to take advantage of this opportunity since I won't have another 4 day block to work on MetaCPAN at any point in the near future.

&nbsp;

<h2 style="text-align: center;">
  Thank You (The Credits)
</h2>

&nbsp;

Basically, I just had to show up and do my thing.  That wouldn't have happened without many, many other people who did their part to make this happen.  First off, I should thank [MaxMind](https://www.maxmind.com/en/home) for allowing me to use my annual training time to attend the hackathon.  It's much easier to attend an event like this if you don't have to take vacation to do it.  Basically it was a choice between attending the QAH or attending YAPC::NA. So, I won't be at YAPC this year, but I think it's a worthwhile trade-off.

I should thank my family for letting me swan off to Europe to pursue my hobby and just generally enjoy myself.  (I keep trying to say "this is actually hard work", but nobody at my house is buying it.)

I should say that [Tina Müller](https://metacpan.org/author/TINITA) did a fantastic job of organizing the hackathon, supported by [Andreas König](https://metacpan.org/author/ANDK). Also, [Neil Bowers](https://metacpan.org/author/NEILB) worked his magic to conjure up sponsors for the event. Whenever I saw Wendy van Dijk, she was either hauling food from a shopping trip, washing and preparing food and making trips up and down the stairs to do this. When there's no elevator available, this is no easy task. 🙂

I'll close with a proper thank you to our sponsors!

&nbsp;

  * [thinkproject][3]
  * [Amazon web services][4]
  * [Strato][5]
  * [Booking.com][6]
  * [AffinityLive][7]
  * [Travis CI][8]
  * [GFU Cyrus AG][9]
  * [Evozon][10]
  * [Infinity Interactive][11]
  * [Neo4j][12]
  * [Frankfurt.pm][13]
  * [Perl 6][14]
  * [Les Monguers de Perl][15]
  * [YAPC Europe][16]
  * [Elasticsearch][17]
  * [Liquidweb][18]
  * [Dreamhost][19]
  * [Procura][20]
  * [MongoDB][21]
  * [CampusExplorer][22]
  * [The Perl Weekly][23]
  * [Ron Savage](https://metacpan.org/author/RSAVAGE)
  * Christopher Tijerina
  * [Andrew Solomon](https://metacpan.org/author/ILLY)
  * [Jens Gassmann](https://metacpan.org/author/JEGADE)
  * [Mark Allen](https://metacpan.org/author/MALLEN)
  * [Michael LaGrasta](https://metacpan.org/author/LAGRASTA)

 [1]: https://www.youtube.com/watch?v=1eSlvoO3Vw8
 [2]: https://metacpan.org/author/MIYAGAWA
 [3]: https://www.thinkproject.com
 [4]: http://aws.amazon.com/de/
 [5]: http://www.strato.de/
 [6]: http://www.booking.com/
 [7]: https://www.affinitylive.com/
 [8]: https://travis-ci.com/
 [9]: http://www.gfu.net/
 [10]: https://www.evozon.com/
 [11]: http://www.iinteractive.com/perl.html
 [12]: http://neo4j.com/
 [13]: http://frankfurt.pm/
 [14]: http://perl6.org/
 [15]: http://mongueurs.pm/
 [16]: http://www.yapceurope.org/
 [17]: https://www.elastic.co/
 [18]: https://www.liquidweb.com/
 [19]: http://www.dreamhost.com/
 [20]: http://www.procura.nl/
 [21]: http://www.mongodb.org/
 [22]: http://www.campusexplorer.com/
 [23]: http://perlweekly.com/
