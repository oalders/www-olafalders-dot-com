---
draft: false
title: Preparing for LWP Hack Night
author: oalders
type: post
date: 2017-03-28T02:05:35+00:00
url: /2017-03-28-preparing-for-lwp-hack-night
dsq_thread_id:
  - 5674239765
categories:
  - Perl

---
I've had a couple of people ask me how they can prepare for [LWP Hack Night][1], so I thought I'd just give a quick introduction to the set of modules.

I whipped up a graph of the various GitHub repositories to give you an idea of which are the most popular and which have the most open issues. Those stats seem to roughly correspond.

![/wp-content/uploads/2017/03/chart-768x512.png](/wp-content/uploads/2017/03/chart-768x512.png)

If you want to poke around [the repositories on GitHub][2], that will give you an idea of where you can start.

Now, a lot of these modules have open issues in RT as well, so don't let the GitHub numbers fool you. You can find the RT bugs for the various libraries here:

  * [libwww-perl][3]
  * [HTTP-Message][4]
  * [LWP-Protocol-https][5]
  * [Net-HTTP][6]
  * [URI][7]
  * [WWW-Mechanize][8]
  * [http-cookies][9]
  * [www-mechanize-cached][10]

If you've looked at RT and GitHub, you can see there's a monster amount of work to be done here, including but not limited to:

  * Establishing which bugs are still bugs
  * Establishing which patches could possibly be applied
  * Adding tests for existing pull requests
  * Rebasing some existing pull requests which have merge conflicts
  * Identifying bugs which are possibly in the wrong queue
  * Performing code review of existing pull requests which look like they are close to a state where they could be merged

How you might like to go about this is entirely up to you. If you have time before the meeting to identify some bugs which you may like to approach or comment on, please feel free to get started now. When we're at the meeting, we can work out a plan to divide and conquer. There's more than enough work to go around. We won't (and can't) clear this all up in one evening, but the point here is to make incremental improvements and learn something useful in the process.

Please feel free to get in touch with me in advance if you have any questions about this. The best way to do this would be via the [Toronto Perl Mongers email list][11].

 [1]: https://www.meetup.com/Toronto-Perl-Mongers/events/238292428/
 [2]: https://github.com/libwww-perl
 [3]: https://rt.cpan.org/Public/Dist/Display.html?Name=libwww-perl
 [4]: https://rt.cpan.org/Public/Dist/Display.html?Name=HTTP-Message
 [5]: https://rt.cpan.org/Public/Dist/Display.html?Name=LWP-Protocol-https
 [6]: https://rt.cpan.org/Public/Dist/Display.html?Name=Net-HTTP
 [7]: "https://rt.cpan.org/Public/Dist/Display.html?Name=URI
 [8]: https://rt.cpan.org/Public/Dist/Display.html?Name=WWW-Mechanize
 [9]: https://rt.cpan.org/Public/Dist/Display.html?Name=http-cookies
 [10]: https://rt.cpan.org/Dist/Display.html?Name=www-mechanize-cached
 [11]: http://mail.pm.org/mailman/listinfo/toronto-pm
