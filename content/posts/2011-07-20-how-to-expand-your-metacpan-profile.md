+++
author="oalders"
date=2011-07-20T05:05:00+00:00
title="Expanding Your MetaCPAN Author Profile"
type="post"
url="/2011/07/20/how-to-expand-your-metacpan-profile"
categories=[
  "authors",
  "cpan",
  "jobs",
  "metacpan",
]
+++

Now that you can log in to [MetaCPAN](http://metacpan.org) via Twitter,
Github and Facebook it\'s **trivial** to update your author profile. For
example, if you look at [my author
page](http://metacpan.org/author/OALDERS), you\'ll see some pretty icons
with links to various other sites I care about. All of this takes just
minutes to set up and it does two things:\
\
1) It makes your author page sexier\
2) It makes you easier to find, follow, pester etc\
\
One aim of MetaCPAN is to make it easier to contact authors in the Perl
community. The author info is available via the API. For example, if you
want a list of every author to date who has logged in to update her info
(91 at the time of writing):\
\
<http://api.metacpan.org/v0/author/_search?q=updated:*&sort=updated:desc&size=20000>\
\
Now, let\'s look at some interesting ways you might use this data.\
\
1) Find PAUSE authors on Twitter:\
\
<http://api.metacpan.org/author/_search?pretty=true&q=profile.name:twitter&size=100000>\
\
In combination with Net::Twitter, this info could be used to create a
PAUSE authors list which anyone could follow.\
\
2) Find PAUSE authors on Github:\
\
<http://api.metacpan.org/author/_search?pretty=true&q=profile.name:github&size=100000>\
\
In tandem with the Github API, there are lots of very cool ways you can
use this. Also, this could be a source used in updating
[Acme::CPANAuthors::GitHub](http://metacpan.org/module/Acme::CPANAuthors::GitHub)\
\
3) Create an world map of authors\
\
Some authors have chosen to share their locations (lon/lat), this could
make for interesting maps.\
\
Now, this really scratches the surface, since there are many other
profile types authors have chosen to share like slideshare, coderwall,
google+, facebook, stackoverflow. With so many APIs to choose from, the
mashup possibilities are certainly there.\
\
If you look at existing modules, the
[Acme::CPANAuthors::CountryName](http://metacpan.org/search?q=Acme%3A%3ACPANAuthors)
namespace could be tweaked to use MetaCPAN. It\'s probably much easier
to handle author tracking via the API than by manually adding author ids
to a module which you constantly have to upload to CPAN for any minor
edit.\
\
Now, what\'s missing here? First off, very few authors have added their
IRC names. It would be great to have this as it provides a trivial
method of mapping IRC nicks to actual people.\
\
Secondly, with a few simple additions, MetaCPAN could be used to create
a very powerful Perl jobs site. We\'d need some more info, though.
Something like:\
\
coding_perl_since: YYYY-MM\
may_contact_with_offers: 1\|0\
willing_to_relocate: 1\|0\
\
Those are just some parameters off the top of my head. The way I see it,
we have decent Perl listings for passive job searches. As an employer
you can post on jobs.perl.org and wait for applicants to contact you.
However, with current author information in an API, we could easily put
together a powerful search which could help potential employers locate
authors who are looking for work and who also match a certain set of
parameters (location/willing to relocate/years of experience/etc).\
\
It\'s a very practical use for the MetaCPAN API and it could help to
keep Perl developers employed. It could also reduce some of the
frustration for employers experience as they wait for the resumes to
trickle in.

## Comments

Author: Rafaël Garcia-Suarez

Date: 07/20/2011 08:23:38 AM

  A few remarks to make it more awesome:
1. I can't find where to put my IRC nickname ?
2. What's the benefit of signing on with github ? It doesn't even add a github profile link. (Likewise for twitter)


---

Author: Mithaldu

Date: 07/20/2011 08:42:03 AM

  Metacpan itself doesn't have logins, it uses those of other sites to auth you. And it doesn't add those by default so you can have different auth logins and public profiles if you wish to, or keep your profiles private.


---

Author: Holy Zarquon's Singing Fish

Date: 07/20/2011 08:55:03 AM

  right, that was a good excuse to start using metacpan rather than search cpan.org.  What I did was sign on with my PAUSE account, and then update my old bookmark associated with the keyword "cpan" to read:

<a href="https://metacpan.org/search?q=%s">https://metacpan.org/search?q=%s</a>

Now in firefox anyway I can type cpan  in the url bar and instead of my old search.cpan.org shortcut it now sends me to metacpan with the search term already filled in.  Thanks!


---

Author: Olaf Alders

Date: 07/20/2011 12:13:38 PM

  I'm in favour of more awesome. :)

1) You can add custom fields at the bottom of the profile as long as you use valid JSON, but I guess what I'm suggesting is that "irc" gets added as a standard profile field name so that more authors are encouraged to add it.

2) What Mithaldu said. Basically, it's a valid choice to authenticate against. I suppose you may want to auth against github or Twitter without making that a part of your public profile. 


---

Author: Shawn H Corey

Date: 07/20/2011 02:54:39 PM

  Looks good but how do I can my avatar?


---

Author: Nova Patch

Date: 07/20/2011 05:28:12 PM

  shawnhcorey: you need to create an avatar with gravatar.com and associate it with the email address on file with your PAUSE account.


---

Author: Shawn H Corey

Date: 07/21/2011 05:17:17 PM

  @Nick Patch:  I did.  It never showed up.  :(


---

Author: Johannes Plunien

Date: 07/22/2011 03:54:52 AM

  Thanks for setting me up with a tiny idea: Some sort of index where you can see a list of CPAN authors and their Github data. So I can check out new people I did not know
before and see what interesting projects they have :)!

<a href="http://www.github-meets-cpan.com/" rel="nofollow">http://www.github-meets-cpan.com/</a>


---

Author: Olaf Alders

Date: 07/22/2011 04:54:50 AM

  Firstly, you turned that around with amazing speed. Secondly, I think you're reading my mind. :) That's a really great use of the API!


---

Author: Olaf Alders

Date: 07/27/2011 05:19:38 PM

  Did you ever get this resolved? If not, please check in at #metacpan on irc.perl.org or open an issue at <a href="https://github.com/CPAN-API/metacpan-web/issues" rel="nofollow">https://github.com/CPAN-API/metacpan-web/issues</a> so we can get it sorted.

