+++
author="oalders"
date=2011-08-31T05:28:01+00:00
title="Kickstarting the Gitpan"
type="post"
url="/2011/08/31/kickstarting-the-gitpan"
categories=[
  "cpan",
  "github",
  "gitpan",
  "metacpan",
  "perl",
]
+++

If you\'ve played with [Gitpan](https://github.com/gitpan) at all, you
probably have an idea of how cool this project is. The idea behind
Gitpan is to take all of CPAN and make it available as Git repositories
which are tagged by release. It\'s a great idea. It makes it trivial for
Github (and Git users in general) to create patches for modules which
don\'t already exist in a public Git repo. It\'s also useful in the case
where [the original Git repositories for modules on CPAN may no longer
easily be found online](http://marcel-maint.github.com/).\
\
Now, if you\'ve followed [the Gitpan
project](https://github.com/schwern/gitpan), you probably also know that
it is not currently up to date, which is a shame. I contacted
[Schwern](https://metacpan.org/author/MSCHWERN) about this recently and
he was kind enough to create and tag some [issues which are
blockers](https://github.com/schwern/gitpan/issues?sort=created&labels=getting+it+running+again&direction=desc&state=open)
to the resumption of Gitpan.\
\
If anyone out there has some interest in getting this project back
online, there\'s enough info in these issues to get you started. There
may well also be some resources in the [MetaCPAN
API](https://github.com/CPAN-API/cpan-api/wiki/Beta-API-docs) which
could speed the work along as well. If Gitpan gets back up and running
it would be one more resource we could link to from
[metacpan.org](http://metacpan.org) and could likely lead to some more
interesting mashups down the line.\
\
If you do feel inclined to do some heavy lifting on this, please stop by
#metacpan so that we can give you some guidance as to how best to
integrate MetaCPAN with Gitpan.

## Comments

Author: olsthrn

Date: 08/31/2011 08:25:28 PM

  A similar project is <a href="https://github.com/ggoossen/cpan2git" rel="nofollow">cpan2git</a>.


---

Author: Olaf Alders

Date: 08/31/2011 09:36:04 PM

  Very nice! I was not aware of this project. Thanks for pointing it out. 


---

Author: fibo

Date: 09/01/2011 10:50:29 AM

  How can update my cpan module on gitpan?

