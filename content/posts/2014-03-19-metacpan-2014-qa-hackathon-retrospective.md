+++
author="oalders"
date=2014-03-19T02:24:30+00:00
title="MetaCPAN 2014 QA Hackathon Retrospective"
type="post"
url="/2014/03/19/metacpan-2014-qa-hackathon-retrospective"
categories=[
  "MetaCPAN",
  "qa hackathon",
]
+++

This was my second QA Hackathon, the first being 2012 in Paris. This
year, I had a lot of good conversations with various people about
MetaCPAN\'s role in the Perl ecosystem and I pushed a decent amount of
code. A lot of it is waiting to be merged, but here\'s the gist of it.\
\
On the plane on the way over, I did a bunch of cleanup on the API.
Mostly style changes, but it makes some of files easier on the eyes.
[RWSTAUNER](https://metacpan.org/author/RWSTAUNER) was kind enough to
fix my failing build after I pushed the code.\
\
When [Ovid](https://metacpan.org/author/OVID) released
[TAP::Stream](https://metacpan.org/pod/TAP::Stream), breaking it out of
[Test::Class::Moose](https://metacpan.org/pod/Test::Class::Moose), it
briefly disappeared from MetaCPAN. This reminded me of how annoying it
is to find missing modules. So, I added a view to the author pages which
will let you paginate through all releases ever uploaded by any author.
I think it\'s quite helpful, even if it\'s not something that will be
used a lot.\
\
I had some good conversations with [Paul
Johnson](https://metacpan.org/author/PJCJ) about the progress of
[CPANCover.com](http://cpancover.com). There was an existing pull
request to add CPANCover links to MetaCPAN. After a chat with him, he
was able to provide a JSON file on CPANCover which MetaCPAN can use to
provide the links. This logic is currently in the MetaCPAN front end,
but it will likely be moved to the API once the API for CPANCover is
stable. On the plane on the way home I decided that the CPANCover code
could actually be refactored into its own CPAN module, so I\'ve now done
this and [pushed the repo to
GitHub](https://github.com/oalders/www-cpancover). I want to run it past
Paul Johnson before uploading the module to CPAN.\
\
After speaking with Neil Bowers about an older issue he had opened
regarding indexing of 06perms.txt, I added support for that to the
MetaCPAN API. Once this endpoint is available, it will give you the
owner and co-maint permissions for any CPAN module. I had initially
thought that just providing the c, f and m flags that are in 06perms.txt
would be sufficient, but Neil set me straight about the nuances of the
different flags and the pitfalls that come with making assumptions about
them. I used his
[PAUSE::Permissions](https://metacpan.org/pod/PAUSE::Permissions) module
to do this work. My takeaway from our conversation is that, outside of
issues with PAUSE itself, nobody really needs to care about m,c and f.
What you need to care about his who has ownership and who has co-maint.
That\'s it. Dealing with the flags directly without knowing all of the
nuances of how PAUSE works, could take you down a road which leads to
heartache.\
\
Moving forward, Neil will likely tweak PAUSE::Permissions to optionally
use the MetaCPAN API for permissions lookups, which could greatly speed
up lookups of permissions of single modules. So, there\'s already an
immediate application for having this code in the API.\
\
I was also able to add some code samples to the [metacpan-examples
repository](https://github.com/CPAN-API/metacpan-examples). In the
absence of thorough documentation, these code samples serve as a good
example for people to get up and running with the API.\
\
At the Paris QA Hackathon 2 years ago, [Michael
Peters](https://metacpan.org/author/WONKO) had opened a pull request for
guessing the name of a module from .pod files which are missing a =head1
NAME section. I was able to tweak this work and add some tests so that
we can merge it into the API. Don\'t ask me why it took 2 years. I\'m
not sure there\'s a compelling reason.\
\
About 9 months ago, [Yanick](https://metacpan.org/author/YANICK) sat
down and hacked together some great functionality for adding
recommendations to MetaCPAN. The basic idea is that you can anyone can
add metadata to modules in the spirit of \"SEE ALSO\". For instance, you
could tag CGI.pm with \"see also\" Plack. In this way, we could collect
metadata about related CPAN modules and, in some cases, which modules
have been superseded by others. I didn\'t wrap up Yanick\'s work, but I
did rebase it to keep his branch up to date with the latest masters. I
also now have a better idea of what needs to be done to finish it up. I
probably won\'t be the person to finish this work, but we have extra
helping hands with MetaCPAN now. I\'ll get to that shortly.\
\
I also spent a bit of time with [Salve
Nilsen](https://metacpan.org/author/SJN), who is working on documenting
some things happening in open source. We actually had two interviews.
One on Saturday and another on Sunday because the Saturday interview
didn\'t get recorded properly. I\'m not exactly sure how that
information is going to be used, but he\'s certainly up to speed on
MetaCPAN now. :)\
\
I\'ve had a handful of people contact me over the last few weeks about
participating in the Google Summer of Code (GSoC) and the Outreach
Program for Women (OPfW). We\'ve asked potential participants to make
code contributions to MetaCPAN before they fill out their applications
to participate. All of these interested parties are completely new to
MetaCPAN, so they require a fair amount of help and supervision. I was
able to spend some of my hackathon time on code reviews, evaluations of
each student and even a Google Hangout to troubleshoot one student\'s
work. The result of this is that I think we\'re going to have some
strong applications for both GSoC and OPfW this year. The MetaCPAN TODO
list is quite massive, so I\'m really looking forward to the extra help
and I hope that we can get a successful applicant or two.\
\
Aside from this, there were the social aspects of the hackathon, where
you get to know people a little better. I can\'t overstate how helpful
this is. Getting to know someone in person can be massively helpful when
speaking with them later over IRC etc and it leads to better
communication and fewer unfortunate misunderstandings. It\'s a very good
thing.\
\
On a personal note, I had the chance to spend some time with family in
Germany on the day before the hackathon and I was able to spend an
evening in Paris before my flight back to Toronto. I even worked in a
morning run past the Louvre, through the Jardins des Tuileries, along
the Seine, down the Champs-Élysées and back to my hotel. I\'ve never
gone for a run before boarding a plane, but it was a good way to prepare
for a lot sitting down in airplanes, airports etc. I highly recommend
it.\
\
I\'d like to thank everyone involved with the hackathon, particularly
[BooK](https://metacpan.org/author/BOOK) and
[Laurent](https://metacpan.org/author/ELBEHO), for all of their hard
work. There\'s a lot that goes into organizing something like this and
they\'ve done an excellent job. The amount of work I was able to remove
from my MetaCPAN TODO list and the amount of knowledge I was able to
glean from a room full of smart people have me convinced that my time at
the Hackathon was well spent. Getting funded to attend something like
this forces you to take it quite seriously, since you\'re there on
someone else\'s dime. [I\'m grateful to our sponsors for making this
possible](http://act.qa-hackathon.org/qa2014/sponsors.html). They\'ve
done a huge service to the Perl community by providing the funds
required to make something like this possible.
