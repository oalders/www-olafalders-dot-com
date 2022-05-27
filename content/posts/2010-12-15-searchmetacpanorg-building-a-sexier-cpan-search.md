+++
author="oalders"
date=2010-12-15T10:45:34+00:00
title="search.metacpan.org: Building a Sexier CPAN Search"
type="post"
url="/2010/12/15/searchmetacpanorg-building-a-sexier-cpan-search"
categories=[
  "cpan",
  "elasticsearch",
  "perl",
]
+++

As we began working on
[iCPAN](itunes.apple.com/us/app/icpan/id377340561?mt=8), we became aware
of how problematic it can be to figure just exactly what is in the CPAN.
More importantly, we became aware of things we really wanted to do when
interacting with CPAN. Last month, Dave Rolsky posted some comments on a
[next generation CPAN
search](http://blog.urth.org/2010/11/my-programming-related-todo-list.html)
. He has a fairly extensive list of things which a CPAN search could
offer and I\'m more than inclined to think that he\'s on the right
track.\
\
A CPAN search site should:

-   be available to the wider community to clone, fork, patch, pull etc
-   let you upvote/downvote modules
-   have tighter integration with reviews, dependency reports etc
-   allow for complex searches

\
\
There are really so many things it could be. The problem, as I see it,
is that this is too big a job for just one person and that may be where
projects have stalled in the past.\
\
There are many valuable, individual efforts out there for improving CPAN
searching, but there is no one service which has the scope of
[search.cpan.org](http://search.cpan.org). I\'m personally not here to
tell you that I\'m building a better search.cpan site. What I am saying
is that I think it\'s about more than building a better search. I think
the CPAN needs an extensive web service. The web service I envision has
info on modules, distributions, authors and ratings. It\'s RESTful, but
it allows for complex queries. It\'s distributed and the source is open.
It could be expanded to include information from CPANTS and github
issues. Author info would link directly to Github accounts, blogs and
Twitter feeds. It can be expanded to do much more than was originally
intended.\

::: {style="text-align: center;"}
\
Introducing the CPAN-API
:::

\
\
This service does exist, to an extent. Toronto.pm got together at our
October meeting and decided to put something together. What we\'ve come
up with is the [CPAN-API
project](https://github.com/CPAN-API/cpan-api/wiki/API-docs). This is a
project which is an expanding web service for CPAN information.\
\

::: {style="text-align: center;"}
\
Introducing [search.metacpan.org](http://search.metacpan.org)
:::

\
As we were building this web service, we came to realize that it
wouldn\'t be useful without (at the very least) a proof of concept
search site. [ioncache](https://github.com/ioncache) took it upon
himself to write such a site, but he gave himself a special challenge.
His search site would be written entirely in JavaScript. I\'m actually
quite surprised at how far he has gotten over the last 7 or so weeks.
His work can be found at
[search.metacpan.org](http://search.metacpan.org).\
\
search.metacpan.org is pure JavaScript. It queries our web service,
which is built on [ElasticSearch](http://www.elasticsearch.com). We\'re
using Clinton Gormley\'s
[ElasticSearch](http://search.metacpan.org/#/search/module/elasticsearch)
CPAN module to index the data which is hosted in our Rackspace Cloud
instance.\
\
So far, it\'s just beta and there are lots of tweaks and feature
additions taking place. If you have a moment, take a look at the
following searches:\
\
[Module search:
mojolicious](http://search.metacpan.org/#/search/module/mojolicious)\
[Distribution search:
dancer](http://search.metacpan.org/#/search/dist/dancer)\
[Author search: FREW](http://search.metacpan.org/#/author/FREW)\
\
So, this should give you an idea of what we\'re up to. Our hope is that
this doesn\'t remain the project of a few folks in Toronto, but that
there will be lots of clones, forks and pull requests to really flesh
this out. All ideas and comments are welcome. Please get in touch with
us with any feedback you may have.

## Comments

Author: Bonnie Smith

Date: 12/16/2010 12:57:12 AM

  When do you expect to actually compelete the project? I'd like to see this implemented and tested over a wider range of sites so we can workout any bugs or issues on the code side.

Bonnie Smith
COO/Director FXP
<a href="http://www.forexpulse.com" rel="nofollow">http://www.forexpulse.com</a>


---

Author: stevenharyanto.myopenid.com

Date: 12/16/2010 01:52:28 AM

  The CPAN API looks promising. As to upvoting/downvoting modules, where do you plan to store the data?


---

Author: Olaf Alders

Date: 12/16/2010 02:36:45 AM

  That's a good question. I *think* it would make sense to include it in the ElasticSearch index, but we haven't figured that part out yet. What I'd like to see is some sort of authentication layer in the API which would allow you to upvote/downvote/favourite modules from an application of your choice.  It would be nice to be able to follow CPAN authors and even create a custom news feed of activity with your favourite modules, authors etc.  Module tagging would be nice as well.


The idea is that it's not about creating one cool search site, but something that could power many cool search sites, CLIs, mobile apps etc.  You should be able to access your personal preferences from any of those applications.  


We still have a few issues to sort out before we get to that point and we're also waiting to see what kind of traction this gets.  If there's enough interest, I'm sure we can figure the rest out.


---

Author: Steven Haryanto

Date: 12/16/2010 07:42:28 AM

  Yes, and one idea for such site that I had been thinking a while back might be some kind of social networking site where we can "befriend" (or "like", or "follow", and why not also "hate" or "avoid") modules that we like, and later we can draw "social graphs" of these modules.


---

Author: Sawyer X

Date: 12/16/2010 09:20:26 AM

  You're fscking kiddin' me!

This is beautiful. I wish I could contribute to it (and perhaps, with time) and I hope you'll be successful in this attempt.

Great job!!


---

Author: Olaf Alders

Date: 12/16/2010 04:34:15 PM

  That's exactly the sort of application I think you could build with this web service down the line.  Once individuals can start adding their own layers of information to what's already in the CPAN index, it becomes much more valuable to everyone.


---

Author: Olaf Alders

Date: 12/16/2010 04:40:54 PM

  Thanks very much.  You know, I whipped up a very basic Dancer app to test out the POD viewing before we had the JavaScript site, so some of your work has already been leveraged.  My thanks to *you* for that!


---

Author: yanick.myopenid.com

Date: 12/16/2010 04:47:59 PM

  This is awesome!

I'm particularly cheering for the upvote/downvote functionality (I've soliloquized about some very preliminary draft work toward a service that would do that at <a href="http://babyl.dyndns.org/techblog/entry/cpanvote-a-perl-mini-project">http://babyl.dyndns.org/techblog/entry/cpanvote-a-perl-mini-project</a> eons ago), but the whole thing is very, very exciting. 

And I didn't know Toronto.pm was that active. Next time I'm around, I'll have to try and drop in at a meeting, just for giggles. :-)


---

Author: Olaf Alders

Date: 12/16/2010 05:16:36 PM

  Your blog post makes a lot of sense.  If I can convince you to contribute some code and/or get involved in mapping out how some of this stuff should work, that would be great.  :) We've got some ideas on how this should work, but we need more coders on deck. 


Toronto.pm generally meets on the last Thursday of each month.  The last couple of meetings we've gone out after the talks to hash out the direction of the API.  If you find yourself in town, please do come!


---

Author: yanick.myopenid.com

Date: 12/16/2010 07:37:39 PM

  > If I can convince you to contribute some code and/or get involved in mapping out how some of this stuff should work, that would be great. :) 

Twist my arm. :-)  I've joined the mailing list and will see what I can contribute to the party. 

> Toronto.pm generally meets on the last Thursday of each month.

I'm not very often in the GTA, but we do hop there from time to time for mini-vacations in the Big City(tm). Next time we do that, I'll make sure it's on the last week of a month. :-)


---

Author: karpet

Date: 12/17/2010 04:07:51 PM

  Great work.

But why ElasticSearch? Can I help you get it working with a native Perl search, like KinoSearch?


---

Author: Olaf Alders

Date: 12/17/2010 05:22:23 PM

  One of the things we wanted was an easy to use RESTful API and ElasticSearch provides this out of the box and seems to meet our needs so far.  We're using the ElasticSearch Perl module to do the indexing, though.  


To be honest, we went with ElasticSearch on the recommendation of one of our local PerlMongers.  We don't know a lot about KinoSearch.  Does it have a built-in web server and API?


---

Author: karpet

Date: 12/20/2010 03:05:26 AM

  There's Search::OpenSearch::Engine::KSx with which you can use Search::OpenSearch::Server.

There's no REST API yet, but it's been on my todo list and if you were interested in collaborating on the design, it could rise to the top sooner.

I have nothing against ElasticSearch, or Lucene in general. It just seems like a top-to-bottom Perl solution would be somehow philosophically fitting for a CPAN-focused project.

You can find me on #lucy_dev on freenode if you are interested in pursuing this idea.


---

Author: Olaf Alders

Date: 12/20/2010 06:30:33 PM

  Thanks for the follow-up on that.  I think if the REST API had already been in place, it may have been a good fit, but at this point I'm just interested in getting up and running as fast as possible (without creating any more work for myself).  But yeah, top-to-bottom Perl certainly would be nice.  We just don't have a lot of people behind this right now, so we need to find the fastest way to get from A to B.


---

Author: karpet

Date: 12/21/2010 03:33:37 AM

  Makes total sense. Keep up the good work!

