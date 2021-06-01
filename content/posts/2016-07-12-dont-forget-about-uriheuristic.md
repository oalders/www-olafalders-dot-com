---
title: Don’t Forget about URI::Heuristic
author: oalders
type: post
date: 2016-07-12T20:51:27+00:00
url: /2016/07/12/dont-forget-about-uriheuristic
dsq_thread_id:
  - 5502201844
categories:
  - Perl
  - Programming

---
Imagine you've got some user input that is supposed to be a valid URL, but it's user input, so you can't be sure of anything. It's not very consistent data, so you at least make sure to prepend a default scheme to it. It's a fairly common case. Sometimes I see it solved this way:

<pre>my $url = 'example.com';
$url = 'http://' . $url unless $url =~ m{http://}i;
</pre>

This converts **example.com** to **http://example.com**, but it can be error prone. For instance, what if I forgot to make the regex case insensitive? Actually, I've already made a mistake. Did you spot it? In my haste I've neglected to deal with **https** URLs. Not good. [URI::Heuristic][1] can help here.

<pre>use URI::Heuristic qw(uf_uristr);
my $url = 'example.com';
$url    = uf_uristr( $url );
</pre>

This does exactly the same thing as the example above, but I've left the logic of checking for an existing scheme to the URI::Heuristic module. If you like this approach, but you'd rather get a [URI][2] object back then try this:

<pre>use URI::Heuristic qw(uf_uri);
my $url = 'example.com';
$url    = uf_uristr( $url );
say $url->as_string;
</pre>

## Caveats

<pre>use URI::Heuristic qw(uf_uri);
my $url = uf_uri('/etc/passwd');      # file:/etc/passwd
</pre>

Are we sure this is what we want? Checking the **scheme** is helpful and even if we weren't using this module, we'd probably want to do this anyway.

<pre>use List::AllUtils qw( any );
use URI::Heuristic qw(uf_uri);

my $url = uf_uri('/etc/passwd');
unless ( $url->scheme && any { $url->scheme eq $_ } ('http', 'https') ) {
    die 'unsupported scheme: ' . $url->scheme;
}
</pre>

That's it! This module has been around for almost [18 years now][3], but it still solves some of today's problems.

 [1]: https://metacpan.org/pod/URI::Heuristic
 [2]: https://metacpan.org/pod/URI
 [3]: https://metacpan.org/pod/release/GAAS/URI-0.09/URI/Heuristic.pm
