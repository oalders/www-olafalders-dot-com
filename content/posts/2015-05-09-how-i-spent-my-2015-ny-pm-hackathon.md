---
title: How I Spent my 2015 NY.pm Hackathon
author: oalders
type: post
date: 2015-05-09T02:26:16+00:00
url: /2015-05-09-how-i-spent-my-2015-ny-pm-hackathon
dsq_thread_id:
  - 3748895123
categories:
  - MetaCPAN
  - Perl
  - Programming

---
On May 2, 2015 I had the pleasure of attending the NY.pm hackathon, which was hosted at the Bloomberg tower in Manhattan. I was privileged to be one of 5 developers to have their travel and hotel sponsored by Bloomberg L.P. This made attending the event very easy for me. Basically all I had to do was show up at the airport and the rest was taken care of for me!

The event was very well organized, had a great vibe and was very encouraging to newcomers (to Perl and to open source contributions). For my part, I was there to work on [MetaCPAN](https://metacpan.org/) and (hopefully) be there as a resource to anyone else who wanted to contribute to MetaCPAN.

I'm happy to say that I got a number of things done. I was able to fix all of the failing tests on [ElasticSearchX::Model](https://metacpan.org/pod/ElasticSearchX::Model). This is a module which MetaCPAN relies on heavily. Going into it, I wasn't sure if the failures were in the code or in the tests. Luckily it was just a problem with the tests, so that was easy enough to fix. I trapped some warnings while I was at it and eventually got a green light from Travis. I got a good chunk of this done on the flight in, so I was able to finish it and release a new version as my first order of business at the hackathon.

Moving forward I continued to work on the MetaCPAN Elasticsearch upgrade, [which I was working on at the QA Hackathon](/2015/04/26/how-i-spent-my-2015-perl-qa-hackathon/). I was able to fix bugs in the module which imports CPAN mirror data into the little known [mirror endpoint of the API](http://api.metacpan.org/mirror/). I also (mostly) fixed bugs in the module which imports [CPANTesters data into the release objects of the API](http://api.metacpan.org/release/Moose?fields=tests). That still needs some work, but it took a fair amount of digging around.

In addition to this, I worked with [MATTP](https://metacpan.org/author/MATTP), who added more handy [keyboard shortcuts](https://github.com/CPAN-API/metacpan-web/pull/1515) to MetaCPAN. (For example, go to [https://metacpan.org/pod/Plack](https://metacpan.org/pod/Plack) and type "pr" -- that will take you straight to the Github pull requests for this repository). I was able to merge and deploy this change at the hackathon.

I also had some good conversations with [RJBS](https://metacpan.org/author/RJBS) about [finding recursive dependencies for modules](http://rjbs.manxome.org/rubric/entry/2079) and graphing them. It turns out he already has a workable solution for this and I don't think converting his code to use MetaCPAN would actually speed things up for him.

I finally met [Yanick Champoux](https://metacpan.org/author/YANICK), who was a very early contributor to MetaCPAN. I was able to recognize him from the 1/2 of his face which is exposed by his avatar! I should also mention that he helped me find my phone not once, but twice in 24 hours. (I really have to keep better track of it).

I also had a fun dinner with [Florian Ragwitz](https://metacpan.org/author/FLORA) and [Augustina Ragwitz](https://metacpan.org/author/AUGGY). (Florian has been involved with MetaCPAN since it was about six months old). 

And, to round out the namedropping, I also met the following folks for the first time: I had an interesting chat with [David Farrell](https://metacpan.org/author/SILLYMOOS) about [perltricks.com](http://perltricks.com/) and using Perl6 to parse Pod. [Charlie Gonzalez](https://github.com/itcharlie) showed me all of the interesting stuff a Fitbit can track and I had a very brief chats with [Nick Patch](https://metacpan.org/author/PATCH) and [Peter Martini](https://metacpan.org/author/PCM), whom I basically crossed paths with as I was headed for my ride to the airport.

The facilities were outstanding as was the plentiful food (breakfast and lunch). This was all made possible by the sponsors: [Bloomberg](http://www.bloomberg.com/), [RubensteinTech](http://www.rubensteintech.com/) and [PerlTricks.com](http://perltricks.com/). 

The organizers did a fantastic job with all of this, so I should particularly thank [Jim Keenan](https://metacpan.org/author/JKEENAN), [Charlie Gonzalez](https://github.com/itcharlie) and [David Golden](https://metacpan.org/author/DAGOLDEN) and [Kevin P. Fleming](https://github.com/kpfleming).

This was the 2nd NY.pm hackathon. I have a hunch that this means there will also be a 3rd. If you have a chance to attend this hackathon in future, my advice would be **do it**!
