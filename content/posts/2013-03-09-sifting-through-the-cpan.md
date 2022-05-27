+++
author="oalders"
date=2013-03-09T03:32:01+00:00
title="Sifting Through the CPAN"
type="post"
url="/2013/03/09/sifting-through-the-cpan"
categories=[
  "cpan",
  "modules",
  "perl",
  "tagging",
]
+++

Some interesting stuff has been said today on [The Four Major Problems
with
CPAN](http://blogs.perl.org/users/brendan_byrd/2013/03/the-four-major-problems-with-cpan.html),
[Don\'t release experiments to
CPAN](http://blogs.perl.org/users/neilb/2013/03/dont-release-experiments-to-cpan.html)
and [CPAN is for experimentation and I hope that never
changes](http://www.dagolden.com/index.php/1946/cpan-is-for-experimentation-and-i-hope-that-never-changes/).\
\
If you haven\'t read these posts yet, I encourage you to do so. They\'ve
all got interesting things to say.\
\
(As an aside, let me say that I think PAUSE authors could probably
participate more on [PrePAN](http://prepan.org/). I\'ve posted a few
things there and found it quite helpful. Even if your module is already
on CPAN and you just want feedback on it, post something on PrePAN.
I\'ve found the discussion to be of a good quality and actually quite
positive.)\
\
One of the proposals which was being discussed was not (immediately)
uploading experiments to CPAN. Now, even if we were to propose people
uploading less modules (which, to be clear, I\'m **not** proposing), we
still have many years worth of good, less good and kind of crazy code to
sift through. What this tells me is not that CPAN is full of junk,
deprecated modules and weird stuff, but that we need better search tools
to deal with the code we already have. The web on the whole is full of
stuff of questionable quality, but modern search engines generally do a
decent job of cutting through the noise. We should also be able to cut
through the noise. This is one of the goals of MetaCPAN, but we haven\'t
quite gotten there.\
\
Right from the beginning, we\'ve wanted to implement some system of
tagging, which would allow interested parties to impose their own views
on what a module is or is not. Imagine tags like \"deprecated\",
\"author unresponsive\", \"author deceased\", \"best practices\",
\"needs love\", \"looking for maint/co-maint\". The list goes on. You
just need to use your imagination. These sorts of tags could a) help
improve search results and b) help humans sift through the results when
they do get them. There\'s a certain amount of heuristics which can be
applied in the parsing and searching phase, but really I think we just
need humans to have more influence on the outcome of results and tags
are a great way to do that.\
\
Now, where is this tagging of which I speak? Well, for now it\'s just a
glimmer in our eyes. My hope was that last year we could round up a GSoC
student to take on the tagging project, but with TPF not being one of
the accepted organizations in 2012, it didn\'t happen for us. There is
still hope for GSoC 2013, which has not yet begun accepting
applications. There is also hope that outside the scope of a program
like GSoC someone will step forward and \"just do it\". Along those
lines, I actually think this would be a good candidate for TPF grant.
I\'ve even considered applying for the grant myself, but I\'d much
rather if it were done by someone with a schedule that\'s a little more
flexible than mine currently is.\
\
We don\'t need to be stuck with trying to figure out which module is
best for which task. That\'s a problem which we, to a great degree, have
the ability to solve. It\'s a layer on top of the CPAN that we can
provide. We just need to do it.

## Comments

Author: Buddy Burden

Date: 03/14/2013 10:14:10 PM

  Okay, so first thing is: I'd never even <i>heard</i> of PrePAN before this latest round of blog posts.  If I wanted opinions on my latest module idea, I'd just post to module-authors.  Can anyone tell me why or when PrePAN is preferable to that?

Secondly, AFA MetaCPAN tagging goes.  I think this is a good idea.  I have a couple of thoughts:

# There already is the ++ button.  This is a very good start.  But I think we need a better way to encourage people to use it.  For instance, Moose apparently has 121 ++s.  That seems way low to me.  We need some way to turn this into a game--people love to play games (hence, Play Perl).  But a game with silly and/or trivial stakes so that no one cares enough to want to ++ things for no good reason.  And, as much as it pains me to say it, I think there needs to be a way to -- something as well, for the modules which are deprecated and/or broken and/or abandoned and/or just plain superseded by something better.

# We need general tagging, but also some specific tagging as well.  That is, let people attach whatever tag they like to something, but also have specific tags which mean specific things and can be used to derive specific meanings.  Otherwise you get tags like "deprecated" and "depracated" and "old; don't use" and "appears to be deprecated at this time" and "crappy" that all mean the same thing but spread the votes out.

# I'd also like to see an author's profile page allow him or her to list their favorite modules.  What are the things you use on a regular basis?  Because the modules that appear on a significant number of those lists (and their dependencies) are probably pretty damn good.  Maybe there should also be a way to list modules that you've tried and found wanting.  I know there's a general hesitancy to implement negative feedback mechanisms, but I feel that's important to reduce cruft.

# All of these are different ways to achieve the same thing, but that's okay:  This is Perl.  There's more than one way to do it.  Modules might tend to accumulate favorable scores in one area but not others.  Modules which accumulate high scores in all areas (many people ++ them, many people tag them with specific positive tags, and many people include them in their lists of favorites)--those modules are pretty damn hot.

Just some thoughts.  In another of these CPAN blog posts, I commented that I'd like to have two CPANs: one for experimental code sharing, and one for settled mature modules.  But it is possible to do both in one repository, if there's a way to distinguish the two.


---

Author: Olaf Alders

Date: 03/25/2013 03:33:56 AM

  As far as PrePAN goes, that's maybe the subject of a blog post in itself, but essentially you have a forum dedicated to discussing your module that is social, not tied to an email thread and has a dedicated URL for discussion and reference.  I think there's a lot of value to that.  For some, this may be a better fit than an email list and the discussions are certainly easier to follow.

We originally had planned on -- as well, but decided we didn't want to put up any barriers to people uploading code who might be sensitive to negative feedback.  I think, so far, that has worked out well.  Appropriate tagging could fill the void there.

+1 to specific tagging.  That would be part of the plan.

You can see modules an author has ++ed on their MetaCPAN author page.  It's maybe not the same as favourite, but again, tagging would be a great solution to that as well.

There are some other things we could try.  We could implement something like Dave Rolsky's "web of trust" using ++ data.  I think that would be quite helpful.  See <a href="http://blog.urth.org/2010/11/01/my-programming-related-todo-list/" rel="nofollow">My Programming-Related Todo List</a> for the context on that.


---

Author: Olaf Alders

Date: 03/25/2013 03:36:07 AM

  It was pointed out to me that I should have mentioned in my original post that <a href="https://metacpan.org/module/Task::Kensho" rel="nofollow">Task::Kensho</a> also has some valuable data for folks looking to find the right module for a given task.

