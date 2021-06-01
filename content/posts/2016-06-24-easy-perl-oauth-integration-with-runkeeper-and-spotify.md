---
title: Easy Perl OAuth Integration with Runkeeper and Spotify
author: oalders
type: post
date: 2016-06-24T23:43:37+00:00
url: /2016/06/24/easy-perl-oauth-integration-with-runkeeper-and-spotify
dsq_thread_id:
  - 5502202472
categories:
  - Perl

---
I've been tooling around with a fun little app that I'm building on evenings and weekends. As part of that work I figured I'd let users authenticate via Runkeeper. Luckily Runkeeper uses OAuth2 and it's all pretty easy to get going with. I've published my very small contribution as [Mojolicious::Plugin::Web::Auth::Site::Runkeeper][1]

On a similar note, earlier this year I also released [Mojolicious::Plugin::Web::Auth::Site::Spotify][2]

If you're already using [Mojolicious::Plugin::Web::Auth][3], then these modules will make it trivial for you connect with the [Runkeeper][4] and/or [Spotify][5] web services.

 [1]: https://metacpan.org/pod/Mojolicious::Plugin::Web::Auth::Site::Runkeeper
 [2]: https://metacpan.org/pod/Mojolicious::Plugin::Web::Auth::Site::Spotify
 [3]: https://metacpan.org/pod/Mojolicious::Plugin::Web::Auth
 [4]: https://runkeeper.com
 [5]: https://www.spotify.com
