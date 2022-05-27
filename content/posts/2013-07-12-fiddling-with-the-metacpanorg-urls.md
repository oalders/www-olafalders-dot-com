+++
author="oalders"
date=2013-07-12T03:59:52+00:00
title="Fiddling with the metacpan.org URLs"
type="post"
url="/2013/07/12/fiddling-with-the-metacpanorg-urls"
categories=[
  "cpan",
  "metacpan",
  "perl",
  "urls",
]
+++

One of the pain points of MetaCPAN is that URLs don\'t always point
where you would expect them to. For example, should a script be found
under metacpan.org/module/\*? Does that make sense? What happens when
someone releases a module with the name of the script? Please note that
we\'re talking about the URLs on the search front end, **not the API**.\
\
We\'ve struggled for a long while with questions like this. How do we
structure URLs on metacpan.org which have a sensible hierarchy? URLs
([like version
numbers](http://www.dagolden.com/index.php/369/version-numbers-should-be-boring/))
should be boring \-- we don\'t want them to offer any surprises.\
\
The bulk of the discussion on this topic can be found in [this
issue](https://github.com/CPAN-API/metacpan-web/issues/176). However, if
you want to weigh in on this without wading through the entire
discussion, hop down to [this
comment](https://github.com/CPAN-API/metacpan-web/issues/176#issuecomment-19861442)
and start from there.\
\
The reason I\'m bringing this up now is that a) we think we have
progressed enough in the right direction to ask for some final input on
the subject and b) [Randy
Stauner](https://metacpan.org/author/RWSTAUNER) has indicated that he
will do the heavy lifting here. So, we\'re approaching a consensus and
we have a motivated volunteer. There\'s no time like the present!\
\
So, if you\'d like to be involved in the decision-making process, please
comment on this topic over the next few days as we finalize our approach
to this.
