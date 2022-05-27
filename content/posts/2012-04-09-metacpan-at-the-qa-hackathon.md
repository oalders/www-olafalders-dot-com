+++
author="oalders"
date=2012-04-09T03:47:47+00:00
title="MetaCPAN at the QA Hackathon"
type="post"
url="/2012/04/09/metacpan-at-the-qa-hackathon"
categories=[
  "cpan",
  "metacpan",
  "perl",
]
+++

One week ago, I happily had the opportunity to be at the QA Hackathon in
Paris. In the past I had been vaguely aware that the hackathon exists
and I had some shadowy idea of what goes on at such a thing, but I just
never considered getting involved. I didn\'t think it was very much
related to the sorts of things I work on. Happily, it turns out that I
was wrong.\
\
**First off, thanks!**\
\
Before I even talk about the code, I need to thank the organizers and
the sponsors. Philippe Bruhat (BooK), Laurent Boivin (elbeho) and Les
Mongueurs de Perl did an absolutely fantastic job keeping a large group
of people housed, fed and occupied. The only responsibility I had to
take for myself was booking a flight and finding my way from the airport
to the hotel. Beyond that, pretty much everything was taken care of. The
venue (which was really cool) was maybe a 5 minute walk from the hotel.
The dinners I attended were great. At the hackathon itself there was an
impressive supply of food (including fresh fruit) pretty much always
available. Your needs were met. :)\
\
This, of course, would not have been possible on this scale without the
help of many generous sponsors. It\'s encouraging to see that companies
(and individuals) see the value in this sort of work. Please note that I
am lifting this list of sponsors directly from [David Golden\'s
Hackathon
post](http://www.dagolden.com/index.php/1660/perl-qa-hackathon-wrapup/):\
\

[The City of Science and
Industry](http://www.cite-sciences.fr/fr/cite-des-sciences/),
[Diabolo.com](http://www.diabolocom.com/),
[Dijkmat](http://www.dijkmat.nl/), [DuckDuckGo](http://duckduckgo.com/),
[Dyn](http://dyn.com/), [Freeside Internet
Services](http://freeside.biz/freeside/), [Hedera
Technology](http://www.hederatech.com/), [Jaguar
Network](http://www.jaguar-network.com/), [Mongueurs de
Perl](http://www.mongueurs.net/), [Shadowcat Systems
Limited](http://shadow.cat/), [SPLIO](http://www.splio.com/),
[TECLIB\'](http://www.teclib.com/en),
[Weborama](http://weborama.com/2/), and [\$foo
Magazine](http://www.perl-magazin.de/)

\

**These people made individual donations:** Martin Evans, [Mark
Keating](http://mdk.me/), Prakash Kailasa, Neil Bowers, 加藤 敦 (Ktat),
Karen Pauley, Chad Davis, Franck Cuny, 近藤嘉雪, Tomohiro Hosaka, Syohei
Yoshida, 牧 大輔 (lestrrat), and Laurent Boivin

\
\
**Some of the highlights for MetaCPAN**\
\

-   A very short chat with Andreas Koenig set off a chain of events that
    is seeing 2packages.details updated much more frequently than it was
    up until now. This means that newly uploaded modules will be
    searchable on MetaCPAN much more quickly than they have been over
    the last year or so. This is a major improvement and one that I\'m
    particularly happy about. We still have some work to do on MetaCPAN
    to take advantage of the more frequent updates, but it\'s excellent
    to have them.
-   Florian Ragwitz (rafl) and Matthew Horsfall (wolfsage) created a new
    /distribution endpoint to the MetaCPAN API. This endpoint currently
    contains only a summary of the RT bug counts. In future, Github
    issues and other things which are not specific to a versioned
    distribution will also be found here.
-   Michael Peters (wonko) fixed a bug in the indexer which affected
    about 800 packages. He also wrote a command line script we can use
    to analyze which modules are missing from the index and why that
    might be. This is going to be a very helpful diagnostic tool and one
    that we, frankly, needed a long time ago. We\'re very happy to have
    this now.
-   Nicholas Perez (nperez) wrote
    [MetaCPAN::API::Tiny](https://metacpan.org/module/MetaCPAN::API::Tiny),
    which is basically an implementation of
    [MetaCPAN::API](https://metacpan.org/module/MetaCPAN::API)
-   After David Golden (dagolden) mentioned that a MetaCPAN command line
    interface would be helpful, Chris Nehren (apeiron) [began working on
    it](https://github.com/apeiron/metacpan-api/tree/apeiron/metacpan-cli).
    I\'m not sure why nobody thought to create one in the past, but this
    is going to be another helpful tool to come out the hackathon.
-   I spent some of my time fixing bugs and adding a bit of new stuff,
    but most of my time was spent looking over existing pull requests as
    well as dealing with pull requests from the hackathon itself. I was
    also able to spend time with new MetaCPAN hackers, getting them
    started with their own local deployments as well as working on the
    codebase. I didn\'t get to write as much code as I had planned to,
    but spending time accepting patches and working with developers who
    are new to the project is an ideal situation to be in.

\
\
**A New MetaCPAN Logo**\
\
As part of the weekend, we were also able to announce [Raul Matei as the
winner of the MetaCPAN logo
contest](http://entries.contest.metacpan.org/2012/03/and-winner-is.html),
which [EPO](http://www.enlightenedperl.org/) so kindly provided the
prize money for. We went live with the new logo immediately, which looks
great and takes care of one more missing piece of the puzzle.\
\
**Wrapping Up**\
\
We now have a number of new hackers who are armed with enough knowledge
to bend the MetaCPAN code to their will. Together we fixed bugs,
improved the test suite, worked on new functionality, dreamed up even
cooler things to do and generally got a lot of good things done.\
\
For MetaCPAN, the hackathon feels like a great success. I\'m so pleased
to have been a part of it. I got to meet lots of great people, hang out
in a beautiful city and focus my daytime hours on MetaCPAN without any
distractions. I\'ve also got a much clearer understanding of what the QA
Hackathon is all about it and I see how valuable it really is to get all
of these hackers in the same room together. It\'s so much easier when
you can walk up to some and \*actually\* poke them for information
rather than having to wait until they check IRC, email, a bug queue etc.
That in itself is a big win.
