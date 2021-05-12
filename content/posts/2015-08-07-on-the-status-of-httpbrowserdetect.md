---
title: On the status of HTTP::BrowserDetect
author: oalders
type: post
date: 2015-08-07T10:54:41+00:00
url: /2015-08-07-on-the-status-of-httpbrowserdetect
dsq_thread_id:
  - 4026013294
categories:
  - Perl

---
One of the first modules I ever took over on [CPAN][1] is the venerable [HTTP::BrowserDetect][2]. I remember I was giving a talk at [Toronto PerlMongers][3] one night about a UserAgent parser I had worked very hard to build. When I was finished, one of the comments was "Why didn't you just use HTTP::BrowserDetect"? The answer was pretty simple -- I just didn't know about it.

After I got familiar with HTTP::BrowserDetect, I saw that it was on some levels better that what I had written, but that it needed some love. To his credit, the module's author (Lee Semel) gave me co-maint pretty much immediately. I even [wrote a blog post about my efforts][4]. It looks like that was only my second ever post on blogs.perl.org. Good times! That was 5 years ago (give or take a week), so now feels like a good time to revisit this topic.

About a year after my initial post, [Neil Bowers][5] did one of his very comprehensive module reviews. This time the topic was [UserAgent Parsers][6]. If you haven't read it, it's a very thorough and very good analysis of what was out there at the time. That was the good part. The bad part is that it sat up terribly with other modules in terms of how long it took to parse strings. Neil did, however, conclude that it was the best module at the time for recognizing bots.

After he published this, Neil and I had some back and forth about replacing the guts of some or most available UserAgent parsers with a common parser to reduce many of the duplicate efforts. I did put up a few rough ideas in the form of [UserAgent::UeberAgent][7] but got distracted by various things in the meantime. That however is a digression.

The one takeaway I want to leave you with is that fact that HTTP::BrowserDetect is alive and well. Over the past 5 years it has seen [many, many pull requests][8]. As a result of this, it recognizes even more bots, parses even more UserAgent strings, has better test coverage and has had some significant cleanups in the internals. (It's still kind of weird on the inside, but it's over 15 years old at this point -- I'll cut it a lot of slack).

What actually drove me to write this post is that Windows 10 was set to roll out on July 29, 2015. That's the same date that I got a pull request which adds [Windows 10 and Windows 10 Edge Browser detection][9]. I was able to upload a new release to CPAN on the same day.

The cool thing about this is that it's not an anomaly. I get lots of pull requests in a very timely manner. I don't really advertise this module, but people find it and send patches. Because it sees a fair amount of use, it is also kept nicely up to date. [It has come a long way since March 16, 2000][10]. It's a teenager, but it's in a good place. It's loved. It's cared for and fed and it still does a great job.

As far as the benchmarking with respect to other modules goes, I'm not sure if Neil will find the time to run another report, but I'd be very interested to see what the current state of affairs is.

There is, however, one thing I am able to benchmark and that is the speed at which I'm traditionally able to merge pull request for this module. Recently I wrote [github-mergevelocity][11], which can tell you how responsive a repository has historically been to attempts at collaboration. Let's see how HTTP::BrowserDetect performs:

<pre>bash-3.2$ github-mergevelocity --url oalders/http-browserdetect
.---------+--------------------+----------+-----+----------+------------+--------+------------+------+-----------.
| user    | repo               | velocity | PRs | merged   | merge days | closed | close days | open | open days |
+---------+--------------------+----------+-----+----------+------------+--------+------------+------+-----------+
| oalders | http-browserdetect | 230      | 61  | 98% (60) | 3/PR (194) | 2% (1) | 2/PR (2)   | 0    | 0         |
'---------+--------------------+----------+-----+----------+------------+--------+------------+------+-----------'
</pre>

60 out of 61 pull requests have so far been merged via the Github "merge" button. On average, it takes 3 days for a pull request to get merged. There are no currently open pull requests and the one request which was closed was handled within 2 days. I'm happy with that record. There are, no doubt, authors who are far more responsive than this, but as an open source contributor, if I get a pull request merged within a week or two of being sent, that seems pretty responsive to me.

This is also a commentary on the quality of the pull requests which I have gotten. They're generally quite good. In cases where some work was needed, it looks like that was done on a fairly quick turnaround as well.

[There are still some open issues][12], so if any of this makes you at all inclined to send a patch or to kick the tires on this small piece of Perl history, I'd be happy to hear about it. 🙂

 [1]: http://www.cpan.org/
 [2]: https://metacpan.org/pod/HTTP::BrowserDetect
 [3]: http://to.pm.org/
 [4]: http://blogs.perl.org/users/olaf_alders/2010/08/httpbrowserdetect-for-all-of-your-useragent-parsing-needs.html
 [5]: https://metacpan.org/author/NEILB
 [6]: http://blogs.perl.org/users/neilb/2011/10/cpan-modules-for-parsing-user-agent-strings.html
 [7]: https://github.com/oalders/useragent-ueberagent
 [8]: https://github.com/oalders/http-browserdetect/pulls?q=is%3Apr+is%3Aclosed
 [9]: https://github.com/oalders/http-browserdetect/pull/110/commits
 [10]: https://metacpan.org/pod/release/LHS/HTTP-BrowserDetect-0.93/BrowserDetect.pm
 [11]: https://metacpan.org/pod/github-mergevelocity
 [12]: https://github.com/oalders/http-browserdetect/issues
