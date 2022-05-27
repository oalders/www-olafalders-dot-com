+++
author="oalders"
date=2012-09-19T05:55:47+00:00
title="Introducing HTTP::CookieMonster"
type="post"
url="/2012/09/19/introducing-httpcookiemonster"
categories=[
  "cookies",
  "cpan",
  "http::cookiemonster",
  "lwp::useragent",
  "oalders",
  "perl",
  "www::mechanize",
]
+++

If you\'ve ever had the pleasure of poking around in your
[WWW::Mechanize](https://metacpan.org/module/WWW::Mechanize) or
[LWP::UserAgent](https://metacpan.org/module/LWP::UserAgent) cookie_jar,
you\'ll know it\'s not an entirely painless process. It\'s certainly not
impossible, but it feels a bit like jumping through hoops. The
cookie_jar functionality in LWP::UserAgent and the modules which inherit
from it is provided by
[HTTP::Cookies](https://metacpan.org/module/HTTP::Cookies). Before I go
any further, I\'d like to thanks [Gisle
Aas](https://metacpan.org/author/GAAS) for HTTP::Cookies, which is a
very important bit of code. This isn\'t a complaint about HTTP::Cookies,
but rather an attempt to make it even more accessible.\
\
Before we do anything with cookies, let\'s make one request to ensure we
have some cookies in our cookie_jar.\
\

        use WWW::Mechanize;
        my $mech = WWW::Mechanize->new;
        $mech->get('http://www.nytimes.com');

\
\
nytimes.com sets a couple of cookies by default and they are now in your
cookie_jar. You can now get a list of your cookies (as objects) with
just a \"use\" statement and 1 additional line of code.\
\

        use HTTP::CookieMonster qw( cookies );
        my @cookies = cookies( $mech->cookie_jar );

\
\
Now you can iterate over your cookies. Available methods are documented
at <https://metacpan.org/module/HTTP::CookieMonster::Cookie>.\
\

        foreach my $cookie ( @cookies ) {
            print $cookie->key, $cookie->val, $cookie->expires, "\n";
        }

\
\
Maybe you just want to get one particular cookie without having to loop
over an array. The NYT website serves an \"RMID\" cookie.\
\

        my $cookie = cookies( $mech->cookie_jar, 'RMID' );

\
\
There\'s one caveat here. It\'s quite possible that you could have
multiple cookies in your cookie jar with the same name, since there\'s
nothing to stop many different domains (or subdomains) from serving up
cookies with the same name. If you\'re not sure, get an array of cookies
instead.\
\

        my @cookies = cookies( $mech->cookie_jar, 'RMID' );

\
\
If you get more than one cookie, you\'ll need to figure out which one
you really want. Calling cookies(\$cookie_jar, \'cookie_name\') in
scalar context will return the first matching cookie. Calling it in list
context will return all cookies in the order in which HTTP::Cookies
provides them.\
\
Now, let\'s say you want to mangle your cookies. That\'s easy to do via
the OO interface.\
\

        use HTTP::CookieMonster;
        my $monster = HTTP::CookieMonster->new( $mech->cookie_jar );
        my $cookie = $monster->get_cookie('cookie_name');
        print $cookie->val;

        $cookie->val('random stuff');
        $monster->set_cookie( $cookie );

        # now fetch a page using the mangled cookie
        $mech->get( $url );

\
\
Now that we can easily read our cookies, we can also easily test them:\
\

        use Test::Most;
        ok( $cookie->secure, "this is a secure cookie" );

\
\
It\'s also simple to add a new cookie to the jar:\
\

        use HTTP::CookieMonster::Cookie;
        my $cookie = HTTP::CookieMonster::Cookie->new
           key       => 'cookie-name',
           val       => 'cookie-val',
           path      => '/',
           domain    => '.somedomain.org',
           path_spec => 1,
           secure    => 0,
           expires   => 1376081877
        );

        $monster->set_cookie( $cookie );
        $mech->get( $url );

\
\
HTTP::CookieMonster will re-examine your cookie_jar every time you call
it. This means that it can keep up with changes to the cookie_jar which
happen outside of your code. Just think of it as a simple wrapper around
HTTP::Cookies. The interface is not yet set in stone, but I think it\'s
quite useable already. Feedback is most welcome.
