+++
author="oalders"
date=2011-02-11T06:11:36+00:00
title="How to set up your own PerlMongers web service in 10 minutes or less"
type="post"
url="/2011/02/11/how-to-set-up-your-own-perlmongers-web-service-in-10-minutes-or-less"
categories=[
  "API",
  "cpan",
  "elasticsearch",
  "metacpan",
  "perl",
  "perlmongers",
  "REST",
]
+++

I\'ve been working with ElasticSearch over the past months as part of
the [MetaCPAN project](http://search.metacpan.org). Using ElasticSearch
as our back end has worked out really well so far. The reason is that,
out of the box, it provides a REST API. So, in our case, we\'ve been
able to concentrate on writing code and not on designing an API,
defining its behaviour, arguing over URL schemes etc.\
\
To be clear, ES is not written in Perl, but there is [a handy Perl
module](http://search.metacpan.org/#/showpod/ElasticSearch) you can use
to get yourself up and running in \*minutes\*.

## Comments

Author: Clinton Gormley

Date: 02/11/2011 11:03:44 AM

  <p>Hi Oalders</p>

<p>nice post!<br /></p>

<p>One question: why do you encode to UTF8?  That should be handled by ElasticSearch.pm. Did you see any issues with encoding? I tried deleting that block and rerunning the script, and the encoding seems fine.</p>
<p>ta</p>
<p>Clint</p>


---

Author: Olaf Alders

Date: 02/11/2011 12:44:02 PM

  Hi Clinton,

I've put up a gist with the error: <a href="https://gist.github.com/822286" rel="nofollow"><a href="https://gist.github.com/822286" rel="nofollow">https://gist.github.com/822286</a></a>.  It went away after I handled the encoding, but from the error message, I really couldn't tell exactly what the issue was.

Thanks,

Olaf


---

Author: Clinton Gormley

Date: 02/11/2011 02:48:51 PM

  Hmmm,that's weird.  Especially as that particular entry has only ASCII characters.

What's the error you get in the elasticsearch log?

I wonder if this is a version thing - what version of Perl , XML::Simple, WWW::Mechanize and WWW::Mechanize::Cached are you using?

clint


---

Author: Olaf Alders

Date: 02/11/2011 03:52:29 PM

  Hi Clint,

I've updated the Gist with the server errors.  You are correct about the modules.  When I switch from Mechanize::Cached to Mechanize, I no longer need to encode.  Weird.

Olaf 

