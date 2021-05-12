---
title: How to Get a CPAN Module Download URL
author: oalders
type: post
date: 2016-07-05T23:46:20+00:00
url: /2016-07-05-how-to-get-a-cpan-module-download-url
dsq_thread_id:
  - 4964836498
categories:
  - MetaCPAN
  - Perl

---
Every so often you find yourself requiring the download URL for a CPAN module. You can use the MetaCPAN API to do this quite easily, but depending on your use case, you may not be able to do this in a single query. Well, that's actually not entirely true. Now that we have v1 of the MetaCPAN API deployed, you can test out the shiny new (experimental) **download_url** endpoint. This was an endpoint added by [Clinton Gormley][1] at the QA Hackathon in Berlin. Its primary purpose is to make it easy for an app like [cpanm][2] to figure out which archive to download when a module needs to be installed. <del datetime="2016-07-06T14:38:21+00:00">[MetaCPAN::Client](https://metacpan.org/pod/MetaCPAN::Client) doesn't support this new endpoint yet, but</del> if you want to take advantage of it, it's pretty easy.

<pre>use strict;
use warnings;
use feature qw( say );

use Cpanel::JSON::XS qw( decode_json );
use LWP::UserAgent;
use URI::FromHash qw( uri );

my $module = shift @ARGV;

my $ua  = LWP::UserAgent->new;
my $uri = uri(
    scheme => 'https',
    host   => 'fastapi.metacpan.org',
    path   => '/v1/download_url/' . $module,
);

my $res = $ua->get($uri);
say decode_json( $res->decoded_content )->{download_url};
</pre>

Now invoke your script:

`<br />
olaf$ perl download_url.pl Plack<br />
https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Plack-1.0039.tar.gz<br />
` 

## Update!

After I originally wrote this post, [MICKEY][3] stepped up and actually added the functionality to [MetaCPAN::Client][4]. A huge thank you to him for doing this. 🙂 Let's try this again:

<pre>use strict;
use warnings;
use feature qw( say );

use MetaCPAN::Client 1.018000;
my $mcpan = MetaCPAN::Client->new( version => 'v1' );

my $module = shift @ARGV;

say $mcpan->download_url( $module )->download_url;
</pre>

That cuts the lines of code almost in half and is less error prone than crafting the query ourselves. I'd encourage you to use [MetaCPAN::Client][4] unless you have a compelling reason not to.

## Caveats

This endpoint is experimental.  It might not do what you want in all cases.  See [this GitHub issue][5] for reference.  Please add to this issue if you find more cases which need to be addressed.  Having said that, this endpoint should do the right thing for most cases.  Feel free to play with it to see if it suits your needs.

 [1]: https://metacpan.org/author/DRTECH
 [2]: https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm
 [3]: https://metacpan.org/author/MICKEY
 [4]: https://metacpan.org/pod/MetaCPAN::Client
 [5]: https://github.com/metacpan/metacpan-api/issues/483
