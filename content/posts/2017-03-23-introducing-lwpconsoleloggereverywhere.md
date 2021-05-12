---
title: Introducing LWP::ConsoleLogger::Everywhere
author: oalders
type: post
date: 2017-03-23T02:30:32+00:00
url: /2017-03-23-introducing-lwpconsoleloggereverywhere
dsq_thread_id:
  - 5708078222
categories:
  - Perl

---
In an earlier post, I introduced you to [LWP::ConsoleLogger][1]. I've been using it heavily since then, but one thing I didn't tackle was how to debug a user agent you can't easily get it. Some modules don't provide a public API which allows you to access their user agent. Or, maybe the user agent which you want to debug is so far removed from your code that you can't easily access its public API. Previously, this was not an easy problem to solve. However, this is no longer the case. [simbabque](https://github.com/simbabque) was kind enough to write [LWP::ConsoleLogger::Everywhere](https://metacpan.org/pod/LWP::ConsoleLogger::Everywhere).

It's quite simple to use.

<pre>use LWP::ConsoleLogger::Everywhere;
</pre>

Simply add this line to your code and run it. Any objects of the [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) family should now dump extensive logging information to your terminal. It can get a bit fancier than that, but this is really all you need to know in order to get started debugging 3rd party LWP::UserAgent-based HTTP requests.

 [1]: http://www.olafalders.com/2016/09/29/useragent-debugging-made-easy/
