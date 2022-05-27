+++
author="oalders"
date=2011-08-03T06:02:50+00:00
title="MetaCPAN Undergoes Unplanned Re-index"
type="post"
url="/2011/08/03/metacpan-undergoes-unplanned-re-index"
categories=[
  "metacpan",
  "perl",
]
+++

Earlier today a some dev work on MetaCPAN had the unfortunate side
effect of dropping the ElasticSearch index. This has effectively forced
us to re-index the site from scratch. What makes this particularly
painful is that we\'ve lost the author data (including +1) which so many
Perl devs have lovingly created over the past few weeks.\
\
The short story is that minicpan should be indexed within a few hours.
The rest of CPAN and BackPAN will likely be in the next day or so.\
\
Because we\'ve been looking at adding new features and haven\'t spent
time on a proper backup strategy, we\'re in a suboptimal place right
now. The good news is that this didn\'t happen several weeks from now
with much more author data. Also, we\'re now forced to find a workable
backup solution as our first priority.\
\
I think now would be a good time to put out a call for volunteers. If
you\'re inclined to help dig in with some sysadmin-minded tasks or just
want to help with the overall MetaCPAN ecosystem, we could really use
your help. The interest in the project is great, but so is the number of
open issues, which grows by the day.\
\
The more devs we have who can dig in and get something done, the closer
we\'ll be to getting a bullet-proof system online which we can deploy
and recommend with confidence.\
\
Now might be a good time to remind folks that we are indeed still in
beta, so there is some allowance for unplanned downtime etc. We\'re
doing our best with the resources we have. If you\'d like to help speed
the progress, your contributions will be warmly welcomed.\
\
Please drop in at #metacpan on irc.perl.org with kudos or complaints.

## Comments

Author: Randy Stauner

Date: 08/03/2011 06:28:10 PM

  Is there a list of issues somewhere sorted or grouped by priority (maybe the same as github issues, maybe not)?


---

Author: Olaf Alders

Date: 08/03/2011 06:44:57 PM

  At this point we're working off Github issues in 2 places:

<a href="https://github.com/CPAN-API/metacpan-web/issues" rel="nofollow">https://github.com/CPAN-API/metacpan-web/issues</a>
<a href="https://github.com/CPAN-API/cpan-api/issues" rel="nofollow">https://github.com/CPAN-API/cpan-api/issues</a>

Right now, we're working off labels as the issues are unsorted. But really, anything which you find interesting is cool. Co-ordination would be key so we don't have two people working to fix the same things, but any and all help is appreciated. :)


---

Author: LoonyPandora

Date: 08/03/2011 08:20:23 PM

  Appreciate the heads up, I'll do what I can to help out.

Can you provide more details about what went wrong? I think data-loss on that scale is too large an issue to explain away with a vague "unfortunate side-effect".

The time you spent building & promoting it, plus the time people spent eagerly filling out their profiles needs a more detailed explanation to restore confidence, I think.


---

Author: Olaf Alders

Date: 08/03/2011 08:40:26 PM

  Any help is appreciated. 

As far as what went wrong, the ElasticSearch mappings got dropped, which took all of the data with it.  It's roughly equal to "DROP database". I haven't seen the code which did the damage, but that's basically the issue right there.

Because of the size of CPAN and BackPAN especially when significant portions are unpacked, the database wasn't backed up. That is, of course, a big problem, but one that hadn't been addressed properly as this is all beta at this point. There had been some discussion, but no concrete plan.

So, the data is not recoverable (bad), but we're looking into adding at least one more machine for backups as well as failover (good). 

The machine we currently have is sponsored, but additional hardware for backups, failover etc costs real money. This project currently has no budget (read sponsor $), so that's another reason we hadn't taken that step yet.

A good way to see this is a project that got bigger (both in bytes and popularity) faster than anyone might have imagined. Lots of administrative details (like backups, uptime monitoring, a distributed environment, sponsor $) haven't been covered off, because there just aren't the resources to assign to them.

So, we're making do with what we have and doing our best to provide a valuable resource to the community. We weren't expecting data loss on this scale, but it's obviously something we're dealing with now.


---

Author: Ron Savage

Date: 08/04/2011 01:45:29 AM

  Hi Olaf

"...we've been looking at adding new features and haven't spent time on a proper backup strategy...".

This is a classic statement of project management failure :-).

Top 3 priorities are - always -:
o Reliability.
o Reliability.
o Reliability.

A non-existent or dysfunctional service is nowhere as good as anybody thinks it is.

That's my contribution....

Cheers
Ron


---

Author: phillipadsmith.myopenid.com

Date: 08/04/2011 01:57:49 AM

  Well, I've personally been very little help since kicking in my $20 over beers at Burgundy's -- so count me in to help out, even if it's just contributing $s. 

For those of you who are complaining, I say: put your money where your mouth is. 

Where can we contribute?


---

Author: Olaf Alders

Date: 08/04/2011 02:30:52 AM

  Hi Ron,

As a mentor of the GSoC project, I take full responsibility for any failings in project management. Backups are important and I dropped the ball there. Having said that, this is an amazing project and great things are happening.

Personally, I'm OK with some unplanned downtime in the beta phase if it means richer functionality to play with. That's all part of the process.  We won't remove the beta designation until we have all of the proper infrastructure in place. It's just unfortunate that we didn't have the user-contributed data backed up, but it's just a matter of people re-entering the data.  It's not like we can't recover from it. In fact, we're already recovered to a great extent. 

We'll do better in future -- there has been extensive discussion about this already -- but more hands on deck are vital to keeping this moving forward.


---

Author: szabgab.com

Date: 08/04/2011 05:20:01 AM

  I got quite upset about this when I first read but I can understand that stuff might happen. Especially to people who do things.

With that said I think it is very important to make sure people feel confident that data they enter will not be lost again. Neither by accident nor due to planned upgrade.

The reason for this is that you want people to engage with the system either by coding or at least by clicking on +1s. I am now a lot less enthusiastic about adding my +1s again as I don't like to do the same thing twice. Eventually I'll do this but it would be much easier if I had an assurance or at least a clear plan that I won't need to do this again.

Hey, someone could probably write a script using the <a href="https://metacpan.org/module/MetaCPAN::API">MetaCPAN::API</a> so each one of us could fetch and backup their own personal data (including their +1s) and then submit them if the database gets dropped again.


---

Author: Aristotle

Date: 08/04/2011 09:46:25 AM

  Not really, Ron.

You will simply fail to get off the ground if you insist on dotting all your Is and crossing all your Ts too early. I have the tendency to do too much of that and it’s not helpful, believe me.

It won’t work if you work shoddily, of course, but with finite resources you have to take calculated risks and accept growing pains to move fast and grow fast. If you take the right risks, you will gain the resources to take care of omissions soon; play it safe and it will take a very long time to get anywhere.

That’s the same tightrope walk that makes startup founders who do it well rich in a short amount of time… under harrowing conditions. The MetaCPAN folks are accidentally getting a training version of the same experience…

