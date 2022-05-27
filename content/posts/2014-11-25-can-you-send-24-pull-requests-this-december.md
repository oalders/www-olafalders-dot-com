+++
author="oalders"
date=2014-11-25T04:38:06+00:00
title="Can you send 24 pull requests this December?"
type="post"
url="/2014/11/25/can-you-send-24-pull-requests-this-december"
categories=[
  "24pullrequests",
  "cpan",
  "github",
]
+++

For many of us, the holiday season is approaching. The Advent calendars
will be kicking off soon, which is great. If you\'re into blogging, I\'m
sure there are some calendars which may still be looking for articles.
However, if you\'re looking to push some code, let me point out
[24pullrequests.com](http://24pullrequests.com/) The idea is that you
send one pull request per day for 24 days.\
\
There are two ways for you to contribute. You can sign up and start
pushing code or you can suggest a project for others to create pull
requests for. <http://24pullrequests.com/projects/new> Hey, you can
probably do both. There\'s no commitment once you start. It\'s just a
fun leaderboard to let you track your progress in the 24 days leading up
to Christmas.\
\
Now, 24 is a lot of pull requests, but keep in mind, they don\'t have to
be just code. Documentation patches are easy to write, easy to merge and
they often don\'t require a deep dive into the code. A lot of times when
I\'m browsing some CPAN docs and I come across a typo or some other
little issue, I just fork the project on Github, edit the files directly
with the Github editor and then send a pull request when I\'m done. I
can usually do this in parallel with reading the docs. So, even if I
don\'t end up using the module directly in my project, I can just send a
pull request with a couple of quick fixes and be done with it. Often the
code gets merged immediately. I sent one to
[MIYAGAWA](https://metacpan.org/author/MIYAGAWA) a few weeks ago that
was merged within about 3 minutes.\
\
So, while you can certainly send as many code patches as you like, keep
in mind that doc patches are easy and they\'re of benefit to everyone
after you who will be reading the same code.\
\
While I\'m on the topic of pull requests, if you\'re providing a
non-trivial patch or just something that should be documented, [be sure
to included it in the Changes file for the repo and credit yourself
appropriately](https://github.com/chromatic/Plack-Test-Agent/pull/2/files).
This makes it that much easier for the maintainer to merge your code and
cut a new release immediately. It\'s the little things in life that can
slow as down. The more obstacles you remove for the maintainer, the
faster you\'re likely to see you code get deployed.

## Comments

Author: Neil Bowers

Date: 11/25/2014 08:22:28 AM

  Excellent idea!

I've added a <a href="https://questhub.io/realm/perl/stencil/54743bb9070ccf091f000097">stencil quest to questhub</a>.

Now if there was only an API we could use to build a list of all the CPAN distributions that have a github repo ...


---

Author: Olaf Alders

Date: 11/25/2014 01:33:23 PM

  :) This script gets you most of the way there.  Just s/twitter/github/.  <a href="https://github.com/CPAN-API/metacpan-examples/blob/master/scripts/endpoints/author/1c-scroll-all-authors-with-twitter-es.pl" rel="nofollow"><a href="https://github.com/CPAN-API/metacpan-examples/blob/master/scripts/endpoints/author/1c-scroll-all-authors-with-twitter-es.pl" rel="nofollow">https://github.com/CPAN-API/metacpan-examples/blob/master/scripts/endpoints/author/1c-scroll-all-authors-with-twitter-es.pl</a></a>


---

Author: Olaf Alders

Date: 11/25/2014 01:34:54 PM

  Ah, you wanted distributions, not authors.  Oops!


---

Author: Gábor Szabó - גאבור סבו

Date: 11/25/2014 04:07:01 PM

  <a href="http://api.metacpan.org/v0/release/_search?q=resources.repository.type:git%20AND%20status:latest&fields=distribution&size=2">a large subset</a> (just set the size= to the appropriate number.)


---

Author: Neil Bowers

Date: 11/25/2014 09:53:44 PM

  Here's a <a href="https://gist.github.com/neilbowers/396bab9baa5866fb66a3">script</a> which generates <a href="http://neilb.org/github-dists.html">table of the 2000 most recently released CPAN distros that have a github repo</a>

