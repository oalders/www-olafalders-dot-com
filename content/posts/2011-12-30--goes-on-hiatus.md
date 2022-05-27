+++
author="oalders"
date=2011-12-30T06:08:05+00:00
title="++ Goes on Hiatus"
type="post"
url="/2011/12/30/-goes-on-hiatus"
categories=[
  "cpan",
  "metacpan",
  "perl",
]
+++

If you saw \@kraih\'s [recent MetaCPAN
tweet](https://twitter.com/#!/kraih/status/152207331986382849), you\'ll
know that MetaCPAN\'s ++ feature has been gamed. Now, we were aware
there was some potential for gaming. Initially you needed a PAUSE id to
be able to ++, but this had an unexpected side effect in that there were
some requests for PAUSE accounts with the justification of \"I\'d like
to be able to ++ on MetaCPAN\". Because this placed an additional burden
on the already busy PAUSE admins, we were asked to remove this
requirement.\
\
The result of this was that the bar was now much lower for someone who
wanted to create a MetaCPAN account and begin using the ++ feature.
People behaved and used the feature as it was meant to be used. It was
helpful, a great addition to the site and it led to a fun little
leaderboard where you could get a glimpse of what people in the Perl
community care about in general. You could also view recent ++ activity,
which could give you an indication of what is trending \"right now\". So
far, so good. The code was written in good faith and the community used
it in that same spirit.\
\
Earlier this week someone start to game the system, apparently creating
fake Github accounts, creating MetaCPAN accounts with that Github login
and then boosting first Dancer and the Mojolicious in the leaderboard. I
don\'t know if it was the same person and I really don\'t care to do the
research. By later today the bot was adding ++ data for modules which
didn\'t even exist \-- a bug we weren\'t aware of. It was getting to the
point of silliness and the ++ feature had at best been rendered useless
and at worst become somewhat of an embarrassment.\
\
So, earlier this evening, I turned off the ++ feature on the MetaCPAN
front end. I\'m not going to pontificate on whether the bot behaviour is
good (points out an obvious weakness in the code) or if it\'s bad
behaviour (the exploit was run without an appropriate issue being opened
first). What I am going to say is that a feature which was very helpful
to many people has been now taken offline. A lot of work goes into this
stuff and some of that work has been rendered useless for the time
being. I can\'t give any kind of estimate as to when this might come
back online. The limiting factors are a) finding an appropriate way of
limiting abuse and b) finding a volunteer to sink the necessary hours
into it.\
\
So, I\'d like to extend my congratulations to the person(s) who sunk the
time into defeating the ++ system, but who conversely can\'t be bothered
to provide a patch to fix the hole. You\'ve accomplished what you set
out to do and now somebody else gets to clean up after you. Your parents
must be so proud.

## Comments

Author: yanick.myopenid.com

Date: 12/30/2011 01:12:26 PM

  Okay, this sucks. And is reminiscent of the likewise spoil-sportish attack on Dancer on CPAN rating last year. 

But, anyway: even though the bot and its master(s) are probably currently leaving you a rather bad taste in your mouth and the desire to kick kittens in your heart, remember that there is a friggin' huge chunk of the Perl community that was using the feature, in a civilized manner. And we were all singing the praises of you MetaCPAN heros. 

The brat and its bot are a drawback. We'll find a way to step over that mess on the carpet, and we'll move on, better and niftier than before. And we'll still sing the praises of you MetaCPAN heros.

And that's the end of the cheesy re-motivational speech. Just felt the need to do something to make you feel better, and Toronto is too far for a manly warrior-hug. :-)

(btw, don't kick the kittens: they are innocent!)


---

Author: :m)

Date: 12/30/2011 04:04:03 PM

  Sad to hear this. :-(
Please don't feel discouraged. 


---

Author: David Precious

Date: 12/30/2011 08:23:31 PM

  Bah - this is why we can't have nice things :|

Could requiring a CAPTCHA be solved for every '++' (or perhaps only for those from people not logged in with a PAUSE account) be a viable partial solution?

Out of interest, was the script/bot hammering from the same IP all the time?  If so, maybe a limited number of ++'s per IP per hour might be a partial solution (although won't help if the script-kiddie involved has access to various IPs).


---

Author: David Precious

Date: 12/30/2011 08:27:58 PM

  Ah, they were using multiple GitHub accounts, I see by @kraih's tweet.

Perhaps a solution would be to fetch details of the GitHub account they're logged in as via the API, and reject the ++ if the account is too new or has no repos/hasn't pushed any commits?  (The latter being something that could be gamed with extra effort by the bot, the former being reasonably game-able by someone willing to stockpile some accounts then wait a while...)

It strikes me that they're also abusing GitHub to do this; perhaps GitHub might like to know, or even to see if they can collaborate at all.

I'd be willing to put in some effort to try to implement workarounds for this, as I think ++'s are a valuable MetaCPAN feature.


---

Author: Olaf Alders

Date: 12/31/2011 06:22:04 AM

  Thanks for the pep talk, Yanick. :)  This reminds me that ++ was actually based on your earlier work.  The annoying part is now having to spend time on a problem that wouldn't have to be solved if everyone just played nice, which was certainly the case until very recently.

At any rate, people are thinking about solutions, so we'll see what they come up with.  And remember, if you're coming down to Toronto around a PM meeting, we'd be more than happy to have you give a talk.


---

Author: Olaf Alders

Date: 12/31/2011 06:22:50 AM

  Thanks, it's much appreciated!


---

Author: Olaf Alders

Date: 12/31/2011 06:34:21 AM

  Thanks very much for your input, David.  I did see a lot of traffic from one IP, but blocking it would have only been a temporary solution.  There are some ideas being batted around in #metacpan about how to deal with this.  The problem is restricting it enough to block the gaming, but without making it too annoying for the vast majority of people who are using it as intended.  If you're inclined to help out in any way, that's certainly greatly appreciated!


---

Author: Sawyer X

Date: 12/31/2011 09:41:55 AM

  I'm really sorry to hear the abuse, but unfortunately, I'm not that much surprised either. Well... maybe a bit surprised how long it took 'till an asshole finally did it.

Last year we've noticed someone posting CPAN reviews for Dancer and many community-written Dancer plugins with the lowest abuse possible and very ugly non-constructive trollish feedback. The reviews were posted at first by completely new users who kept spurring up and wrote the abuse 10-20 seconds after registering and had no other abuse. Later they even took the identities of prominent CPAN community members (f00lish), which then had to step up and say "that wasn't us!"

It's a disgusting epidemic and I'm sorry it had tainted MetaCPAN and ruined the efforts of everyone involved and the fruits of their labor for all of us.

I concur with Yanick on this, and indeed we should not kick the kitties. :)


---

Author: yanick.myopenid.com

Date: 12/31/2011 06:37:17 PM

  <i>Thanks for the pep talk, Yanick. :)</i>

My pleasure. I just know how disheartening is it to pour all your heart and soul in a project, and have it spoiled by a jerk for the sheer evulz of it. In those cases, it's nice to be reminded that for that one jerk, there's a hundred peeps who where actually appreciating and enjoying the work you've done. :-)

<i>This reminds me that ++ was actually based on your earlier work.</i>

Heh. Which in turn reminds me that I should hang more in perl channels on IRC. Gah. I need more time. And perhaps a few more days in my weeks. 


<i>The annoying part is now having to spend time on a problem that wouldn't have to be solved if everyone just played nice, which was certainly the case until very recently.</i>

Amen to that. Alas, though, this must be one of the great leitmotivs of human civilization. I'm pretty sure that somebody uttered something quite similar upon seeing the great 
clouds of dust raised by the incoming Vandal hordes. ;-)


<i>And remember, if you're coming down to Toronto around a PM meeting, we'd be more than happy to have you give a talk.</i>

You betcha. We don't go down to Toronto often (family is based in Montréal), but next time we go, I'll make sure it's around a PM meeting night. :-)


---

Author: Olaf Alders

Date: 01/03/2012 04:40:12 PM

  I remember the abuse with the Dancer ratings.  It's shocking how much spare time some people have.

++ is back as of this morning with CAPTCHA for users without a PAUSE id, so we'll see how that works.

No kittens were harmed in the making of this blog post. :)

