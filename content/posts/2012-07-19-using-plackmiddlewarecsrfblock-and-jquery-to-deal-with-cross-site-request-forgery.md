+++
author="oalders"
date=2012-07-19T09:00:41+00:00
title="Using Plack::Middleware::CSRFBlock and jQuery to deal with Cross Site Request Forgery"
type="post"
url="/2012/07/19/using-plackmiddlewarecsrfblock-and-jquery-to-deal-with-cross-site-request-forgery"
categories=[
  "cross site request forgery",
  "csrf",
  "GET",
  "jquery",
  "perl",
  "plack",
  "plack::middleware",
  "POST",
]
+++

At \$work, our flagship application was recently audited for potential
security issues. One of the items which raised a red flag was the fact
that we weren\'t dealing with the threat of CSRF [(Cross Site Request
Forgery)](http://en.wikipedia.org/wiki/Cross-site_request_forgery). The
solution which we decided to implement was to add a CSRF token to all
POST requests. This token should only be known to the app and the end
user. Passing it along with a POST request gives some measure of
assurance that a POST by the user is intentional and so can help to
reduce the risk of CSRF.

\
\

On the Perl side of things, it was actually easy to implement. Since the
app is deployed under Plack, CSRF tokens could easily be implemented
with
[Plack::Middleware::CSRFBlock](https://metacpan.org/module/Plack::Middleware::CSRFBlock),
albeit [a slightly modified
version](https://github.com/oalders/Plack-Middleware-CSRFBlock/commits/develop)
(which I still need to contact the author about). This module parses
outgoing HTML which is produced by your app. If it finds a form which
can POST, it creates a hidden form input field inside the form and
inserts a CSRF token into it.

\
\

So, that takes care of your traditional forms in HTML, but it doesn\'t
detect your fancy jQuery Ajaxy goodness. It turns out, that\'s fairly
easy to handle in one place as well:\

\
\

            var token = 'some_random_secret';
            // some defaults for all ajax calls
            $.ajaxSetup({
                cache: false,
                data:  {'csrf_token': token}
            });

\
\

And with that, we re-submitted ourselves to the [Burp
Suite](http://portswigger.net/burp/) scanning software, hoping for a
clean bill of health. Again, it was not meant to be. This time, the Burp
Suite pointed out that the CSRF token is not very secret when it is
attached to the params of a GET request. It can show up in browser
history, web server logs, etc. That is sub-optimal to be sure. As far as
fixing this goes, I was still looking for a solution to fix this in one
place. The app is big enough on JS that I wasn\'t about to scour for
every GET and fix this manually. It turns out that jQuery has a solution
for this as well, courtesy of
[StackOverflow](http://stackoverflow.com/questions/6996993/jquerys-ajaxsetup-i-would-like-to-add-default-data-for-get-requests-only):

\
\

            var token = 'some_random_secret';
            // some defaults for all ajax calls
            $.ajaxSetup({
                cache: false
            });

            $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
                // do not send data for GET/PUT/DELETE
                if(originalOptions.type !== 'POST' || options.type !== 'POST') {
                    return;
                }
                options.data = $.param($.extend(originalOptions.data, { csrf_token: token }));
            });

\
\

\
This allows us to mangle only the params of POST requests, leaving GET,
PUT and DELETE untouched. That\'s basically it. There were still some
additional hacks we had to put into place in order to get the tokens to
work with 3rd party plugins (like tinyMCE), but for the most part this
was a very clean and simple solution. It didn\'t clutter the app with a
lot of extra code (Perl or JS) which will need to be maintained. If you
can fix something without seeing a big bump in lines of code, people
will be more inclined to thank you down the line.\

\

\
I should add the caveat that using Plack::Middleware to solve this
particular problem may not scale well for your particular case. The app
in question doesn\'t deal with high volumes of traffic, so the tradeoff
of some extra computation versus a comprehensive HTML audit made it a
very tidy solution for us.

## Comments

Author: mpeters.myopenid.com

Date: 07/19/2012 10:32:21 PM

  I can't really see a reason why having the CSRF token appear in the browser history nor in the server logs is a big problem. CSRF is an attack against the user him/her self and a CSRF token is only vulnerable if it falls into the hands of some other site in the timeframe that it's valid. If another site can get your server logs or the user's browser history you/they have bigger problems then having a short lived CSRF token potentially being used against them.


---

Author: Olaf Alders

Date: 07/20/2012 03:10:48 AM

  I think the issue with the server logs is the CSRF token appearing in a referring URL in *someone else's* server logs.  Specifically the report says:

"Sensitive information within URLs may be logged in various locations, including the user's browser, the web server, and any forward or reverse proxy servers between the two endpoints. URLs may also be displayed on-screen, bookmarked or emailed around by users. They may be disclosed to third parties via the Referer header when any off-site links are followed. Placing session tokens into the URL increases the risk that they will be captured by an attacker."

It was given a severity of "medium" in the grand scheme of things.  Without hijacking the session the token isn't helpful to the attacker, but I guess if there's not a lot of overhead to keeping the token out of the URL, it makes sense.  The other part of the exercise for us is removing enough red flags from the report so that the app passes inspection.  The report is being run as part of the approval procedure for a SalesForce.com application, so the cleaner it looks, the faster the app gets approved.

