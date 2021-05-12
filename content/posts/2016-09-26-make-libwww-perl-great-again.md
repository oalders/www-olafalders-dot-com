---
title: Improving libwww-perl
author: oalders
type: post
date: 2016-09-26T02:14:47+00:00
url: /2016-09-26-improving-libwww-perl
dsq_thread_id:
  - 5174584950
categories:
  - Perl

---
You may have noticed that [WWW::Mechanize](https://metacpan.org/pod/WWW::Mechanize) has seen some releases over the last couple of months. No big, breaking changes, but bugs have been fixed and enhancements have been shipped. This module is part of the [libwww-perl][1] ecosystem and also a part of the [libwww-perl][2] GitHub organization, to which I now also belong. I started pestering people to get involved because these modules, although quite important in the CPAN scheme of things, aren't really on a regular release cycle. I don't have the backstory on everything and this is not a complaint about **anybody** who has commit bits, maint or co-maint. It's just an observation that a lot of modules on CPAN depend on the modules in this organization. The issue queues are slowly growing and pull requests are going unmerged.

I think there's a fairly simple solution to all of this and my hope is that we can crowdsource enough mindshare to get this done. (I'm hoping that previous sentence is fully buzzword compliant).

Now, I don't have a lot of hours of spare time to devote to this stuff in any given week, but this doesn't all fall to me anyway. What I'd like to see is more eyeballs on the code. If you'd like to get involved or you have an interest in seeing things move along with any of these modules, please go through any outstanding pull requests and issues. Even comments such as "LGTM" (looks good to me) are very helpful. If enough people who know what they're doing stamp a "LGTM" on a pull request, then that signals that this code is less risky to merge. If people can look into open issues and identify what is or is not a bug and what is or is not RFC-compliant, then that can speed up the issue review cycle as well.

If you'd like to join the libwww-perl org, then that would be great as well. Probably a good first step for that would be to get involved with reviewing open pull requests and issues or even contributing some code.

Here's a quick summary of the repositories which are currently in the org:

<pre>olaf$ github-mergevelocity --url libwww-perl/WWW-Mechanize --url libwww-perl/libwww-perl --url libwww-perl/URI --url libwww-perl/Net-HTTP --url libwww-perl/HTTP-Message --url libwww-perl/LWP-Protocol-https --url libwww-perl/www-mechanize-cached
.-------------+----------------------+----------+-----+----------+---------------+----------+---------------+----------+-----------------.
| user        | repo                 | velocity | PRs | merged   | merge days    | closed   | close days    | open     | open days       |
+-------------+----------------------+----------+-----+----------+---------------+----------+---------------+----------+-----------------+
| libwww-perl | www-mechanize-cached | 157      | 10  | 80% (8)  | 6/PR (45)     | 0        | 0             | 20% (2)  | 1/PR (2)        |
| libwww-perl | LWP-Protocol-https   | -159     | 23  | 30% (7)  | 34/PR (235)   | 35% (8)  | 129/PR (1034) | 35% (8)  | 644/PR (5155)   |
| libwww-perl | libwww-perl          | -200     | 66  | 33% (22) | 40/PR (874)   | 36% (24) | 165/PR (3962) | 30% (20) | 801/PR (16012)  |
| libwww-perl | URI                  | -207     | 25  | 24% (6)  | 11/PR (64)    | 52% (13) | 234/PR (3041) | 24% (6)  | 823/PR (4940)   |
| libwww-perl | Net-HTTP             | -234     | 15  | 27% (4)  | 127/PR (509)  | 40% (6)  | 244/PR (1462) | 33% (5)  | 585/PR (2925)   |
| libwww-perl | HTTP-Message         | -347     | 28  | 29% (8)  | 101/PR (810)  | 18% (5)  | 447/PR (2236) | 54% (15) | 604/PR (9053)   |
| libwww-perl | WWW-Mechanize        | -360     | 34  | 47% (16) | 135/PR (2159) | 26% (9)  | 391/PR (3516) | 26% (9)  | 1140/PR (10256) |
'-------------+----------------------+----------+-----+----------+---------------+----------+---------------+----------+-----------------'
</pre>

**velocity** indicates how likely a pull request is likely to get merged. You can see that [WWW::Mechanize](https://metacpan.org/pod/WWW::Mechanize) is the worst offender of the bunch, despite my minimal cleanup attempts. You can mostly ignore [WWW::Mechanize::Cached](https://metacpan.org/pod/WWW::Mechanize::Cached) for these purposes as that's a module I've been actively maintaining for a lot of years.

However, you can see that the libwww-perl ([LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent)) repo, for instance takes about 874 days per pull request before that pull is merged. It takes an average of 165 days before a PR is closed and the remaining open pulls have been open for 801 days each. If you're looking at over 2 years before the average pull request is merged, you can see how this probably isn't encouraging people to get involved.

For my part, I've added a Travis CI config to all of the repositories and I've also converted [WWW::Mechanize](https://metacpan.org/pod/WWW::Mechanize) to use [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla). Not all of the repositories are in a passing state, but at least now we have a baseline for passing and failing tests. 

Now, I don't have co-maint on most of a lot of the remaining modules, but I'm willing to pester people who do. People can also help by releasing TRIAL distributions so that CPAN testers can smoke the dist before we pester someone to release a module.

So, that's my plea for today. Please feel free to pitch in and help clean this up. If you rely on these modules at your $work, please find a way to donate a few hours here and there to the upkeep of these modules.

For those of you who are bound to say "what about [Mojo::UserAgent](https://metacpan.org/pod/Mojo::UserAgent) or module X", I have two responses:

1) TIMTOWDI  
2) It's easier to maintain these modules than to update and re-release all of the CPAN which currently use them

Fortunately, I don't know of any really terrible bugs which have gone unfixed, but I think if these modules do see active development and releases, then any terrible bugs will be easier to patch and ship if and when they do rear their ugly heads.

Edit: I neglected to mention that there is #lwp on irc.perl.org for libwww-perl discussion.

 [1]: https://metacpan.org/release/libwww-perl
 [2]: https://github.com/libwww-perl
