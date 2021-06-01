---
title: HTTP::Response may have a different definition of success than you do
author: oalders
type: post
date: 2015-10-24T04:10:31+00:00
url: /2015/10/24/httpresponse-may-have-a-different-definition-of-success-than-you-do
dsq_thread_id:
  - 4254033106
categories:
  - Perl

---
![][1]

This has bitten me before, so I thought it was worth writing about.  [This RT ticket](https://rt.cpan.org/Ticket/Display.html?id=101990) explains it better than I can, but let me sum things up here.

Consider this code:

<pre>use LWP::UserAgent;
my $ua = LWP::UserAgent->new;
my $response = LWP::UserAgent->get('http://example.com/foobar');

if ( $response->is_success ) {
   ...
}
</pre>

99 times out of 100, this will do what you mean. Occasionally it doesn't. 

What is the definition of success? In this case it means that there's [an HTTP response code in the 200s](https://metacpan.org/source/ETHER/HTTP-Message-6.11/lib/HTTP/Status.pm#L108). 

Q: What happens if you've gotten a 200 response code in the server headers but (for example) there's a problem with the response body? 

A: `is_success` still returns true. 

`is_success` gives you a technically correct answer, but in this case technically correct isn't always helpful because something else may have genuinely gone wrong.

Consider what happens in this case where [HTML::HeadParser is not installed](http://stackoverflow.com/questions/11169033/no-content-from-lwp-request).

If you want to check for success with confidence, you may want to check the &#8216;X-Died' header as well.

<pre>use LWP::UserAgent;
my $ua = LWP::UserAgent->new;
my $response = LWP::UserAgent->get('http://example.com/foobar');

if ( $response->is_success && !$response->header('X-Died') ) {
   ...
}
</pre>

That seems like a lot of work, so [I've proposed a workaround](https://github.com/libwww-perl/http-message/pull/25/files) that will at least warn on the fact that the &#8216;X-Died' header exists. I don't know what the right answer is, but I do know that the current behaviour is confusing.

 [1]: http://e.lvme.me/mds82td.jpg
