+++
author="oalders"
date=2011-01-10T03:37:18+00:00
title="Which CPAN Author Fields Should be Searchable?"
type="post"
url="/2011/01/10/which-cpan-author-fields-should-be-searchable"
categories=[
  "cpan",
  "metacpan",
  "perl",
  "web service",
]
+++

Right now, if you get yourself a copy of CPAN (or check out a mirror)
you won\'t find a lot of information about CPAN authors. You\'ll find
name, email, PAUSEID and, in some cases, an URL. It\'s good, but it\'s
not really comprehensive. It doesn\'t tell you how to find an author on
Twitter, Github, Stackoverflow etc. Sure, you can find that stuff out
with some research, but how hard should you really have to work for this
information?\
\
As part of [the MetaCPAN project](https://github.com/CPAN-API/cpan-api),
we\'re trying to aggregate more information about CPAN authors. Since I
originally posted [my request for more author
info](http://blogs.perl.org/users/olaf_alders/2010/12/expanding-your-author-info-in-the-metacpan.html),
there has been a good response. What I asked people to do was to look at
a template of author info and then to add fields which they found to be
appropriate, so that we could make that information available as part of
our web service. So, far, here are the fields which have been proposed.
I should say that all proposed fields have now been exposed via the API.
What you see is an aggregation of fields proposed by various authors.
(It\'s beta, so we can do whatever we like at this point.)\
\

    {
      "BDFOY": {
        "accepts_donations": "1",
        "paypal_address": "brian.d.foy@gmail.com",
        "country": "US",
        "region": "IL",
        "city": "Chicago",
        "website": [
          "http://www.pair.com/comdog",
          "http://about.me/brian_d_foy"
        ],
        "email": [
          "brian.d.foy@gmail.com",
          "bdfoy@cpan.org"
        ],
        "delicious_username": "manske",
        "facebook_public_profile": "http://www.facebook.com/rbo.openserv.org",
        "github_username": "briandfoy",
        "linkedin_public_profile": "http://www.linkedin.com/in/briandfoy",
        "openid": "http://sartak.org",
        "stackoverflow_public_profile": "http://stackoverflow.com/users/8817/brian-d-foy",
        "perlmongers": "Frankfurt.pm",
        "perlmongers_url": "http://frankfurt.perlmongers.de",
        "perlmonks_username": "brian_d_foy",
        "twitter_username": "briandfoy_perl",
        "slideshare_url": "http://www.slideshare.net/brian_d_foy/",
        "slideshare_username": "reneebperl",
        "youtube_channel_url": "http://www.youtube.com/bradmcconahay",
        "amazon_author_profile": "http://www.amazon.com/brian-d-foy/e/B002MRC39U",
        "oreilly_author_profile": "http://www.oreillynet.com/pub/au/1071",
        "books": [
          "0596527241",
          "0321496949",
          "0596102062",
          "0596009968",
          "0596520107",
          "0596101058"
        ],
        "blog_url": [
          "http://blogs.perl.org/users/brian_d_foy/",
          "http://www.effectiveperlprogramming.com/",
          "http://use.perl.org/~brian_d_foy/journal/"
        ],
        "blog_feed": [
          "http://blogs.perl.org/users/brian_d_foy/atom.xml",
          "http://www.effectiveperlprogramming.com/feed",
          "http://use.perl.org/~brian_d_foy/journal/rss"
        ],
        "cats": [
          "Buster",
          "Mimi"
        ]
      }
    }

\
\
To see how some of this info can be used in the context of a web page,
check out [BDFOY on
search.metacpan.org](http://search.metacpan.org/#/author/BDFOY).\
\
This info is already searchable as part of the metacpan API. For
instance, to get info on BDFOY, follow this link:\
\
<http://api.metacpan.org/author/BDFOY>\
\
That\'s, of course, a simple GET request for one author. You can create
much more powerful queries for author info, but that\'s a subject for
another post.\
\
[An authentication system is already in the
works](http://babyl.dyndns.org/techblog/entry/2011-here-we-come), which
authors will be able to use to update their own info. In the meantime,
however, you can get in on the ground floor by adding your author info
using [the instructions I posted a couple of weeks
ago](http://blogs.perl.org/users/olaf_alders/2010/12/expanding-your-author-info-in-the-metacpan.html).\
\
If you\'ve already added your author info, thank you very much! If you
have not yet done so, please take a moment to do so. I\'ve been watching
the time between forks and pull requests and some of the time lapses are
as short as 9 minutes. So, it\'s not a lot of time out of your day.
You\'ll be making useful information available to the community as well
as helping to define how part of the MetaCPAN web service will operate.\
\
If you have a moment to tweet something about this project or pass it on
to your network of developers, it would be greatly appreciated as well.

## Comments

Author: Sawyer X

Date: 01/10/2011 08:49:19 AM

  Keep up the good work! :)


---

Author: Jay Allen

Date: 01/11/2011 09:04:29 PM

  Wow, that's super comprehensive, Brian.  You guys had everything I thought of covered and a hell of a lot more.  Still, determined to find *something* all I can come up with is Ohloh username (e.g. mine is <a href="https://www.ohloh.net/accounts/jayallen" rel="nofollow">jayallen</a>)


---

Author: Olaf Alders

Date: 01/12/2011 03:37:28 PM

  Actually, I was thinking of: 

coding_perl_since = YYYY  

Once the index has more information, I'd like to see it used for a job site where you could search on Perl devs based on favourite modules, current country etc.  Knowing how many years experience someone has would be helpful info as well.

