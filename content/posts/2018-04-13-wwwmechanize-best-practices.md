---
title: WWW::Mechanize Best Practices
author: oalders
type: post
date: 2018-04-13T04:41:11+00:00
url: /2018/04/13/wwwmechanize-best-practices
categories:
  - Perl
  - Programming

---
## fields

Recently at $work we were discussing some of the behaviours of [WWW::Mechanize][1] when submitting forms. For instance, when you pass the `fields` parameter to the `submit_form()` method, Mechanize might take a very lax approach to submitting your data. Imagine the following form:

<pre></pre>

Now take the following code:

<pre>my $mech = WWW::Mechanize->new;
$mech->get($some_url);
$mech->submit_form(
    form_id => 'foo',
    fields  => { A => 'foo', B => 'bar', C => 'baz' },
);
</pre>

Mechanize will happily post _all_ of these fields to the form for you, even though the form doesn't contain an input with the field "C". If there is no server side validation which checks for unknown fields, you'll likely get a 2XX status code in your response and all will appear to be well. This can lead to some confusing and hard to debug situations, especially if you've done something as subtle as misspelling an input name. You could be banging your head against the wall for quite some time.

## with_fields

You can protect yourself from this scenario via `with_fields`, which will only submit forms which contain all of the provided fields.

<pre>my $mech = WWW::Mechanize->new;
$mech->get($some_url);
$mech->submit_form(
    form_id => 'foo',
    with_fields => { A => 'foo', B => 'bar', C => 'baz' },
);
</pre>

If you try to run this code, Mechanize will **die** with a message like "**There is no form with the requested fields at&#8230;**". This is already a big improvement. (Note that `form_id` is optional in this case. If you leave it out then Mechanize will only look for a for which contains _all_ of the fields provided by `with_fields`. If we provide `form_id` then Mechanize will want a form which matches the provided id and which also provides all of the required fields).

## strict_forms

Can we do any better than this? You bet. We can supply a `strict_forms` parameter to `submit_form`. This switches [HTML::Form's][2] `strict` behaviour on. From HTML::Form's docs:

> Initialize any form objects with the given strict attribute. If the strict is turned on the methods that change values of the form will croak if you try to set illegal values or modify readonly fields. 

That's above and beyond what `with_fields` brings to the table. Handy stuff. Try to do this wherever possible if you want to make your life easier.

<pre>my $mech = WWW::Mechanize->new;
$mech->get($some_url);
$mech->submit_form(
    form_id      => 'foo',
    fields       => { A => 'foo', B => 'bar', C => 'baz' },
    strict_forms => 1,
);
</pre>

If `strict_forms` finds a problem, your code will `die` with something like "**No such field &#8216;C' at&#8230;**".

Notice that the above example uses `fields` and not `with_fields`. I would encourage you to use `fields` with `strict_forms` whenever possible. The reason is that `with_fields` will throw an exception _before_ `strict_forms` is able to perform any validation. So, in many cases you'll end up with the less helpful error message -- the one which doesn't name the offending field(s).

If for some reason, you need `with_fields` for your form selection, keep in mind that `strict_forms` can still find additional issues (like trying to set readonly fields). My advice would be to use `strict_forms` **whenever possible** and to use `with_fields` only in cases where `fields` + `strict_forms` is not possible.

In summary, TIMTOWDI, but here's the order of preference for incantations of `submit_form`:

  * `fields` + `strict_forms`
  * `with_fields` + `strict_forms`
  * `with_fields`

## autocheck

`autocheck` can save you the overhead of checking status codes for success. You may outgrow it as your needs get more sophisticated, but it's a safe option to start with. Consider the following code:

<pre>my $mech = WWW::Mechanize->new;
$mech->get('foobar.comcom');
</pre>

This code doesn't die or warn, since it assumes you will "do the right thing" by checking status codes etc. Now try this:

<pre>my $mech = WWW::Mechanize->new( autocheck => 1 );
$mech->get('foobar.comcom');
</pre>

If you run the above code you'll get something like "**Error GETing foobar.comcom: URL must be absolute at&#8230;**", which can also save you a lot of heartache.

## HTTP::CookieJar::LWP

You are encouraged to install [Mozilla::PublicSuffix][3] and use [HTTP::CookieJar::LWP][4] as your cookie jar. This allows you to take advantage of [HTTP::CookieJar][5] which is more modern than [HTTP::Cookies][6] and "[adheres as closely as possible to the user-agent rules of RFC 6265][7]". See also <https://metacpan.org/pod/HTTP::Cookies#LIMITATIONS>

<pre>use HTTP::CookieJar::LWP ();

my $jar = HTTP::CookieJar::LWP->new;
my $mech = WWW::Mechanize->new( cookie_jar => $jar );
</pre>

## protocols_allowed

How about restricting the protocols your agent might follow? Let's look at `protocols_allowed`: This option is inherited directly from [LWP::UserAgent][8]. It allows you to whitelist the protocols you're willing to allow.

<pre>my $agent = WWW::Mechanize->new( protocols_allowed => [ 'http', 'https' ] );
</pre>

This will prevent you from inadvertently following URLs like `file:///etc/passwd`

## protocols_forbidden

If you don't want to whitelist your protocols, you can blacklist them instead. Unsurprisingly, this option is called `protocols_forbidden`: This option is also inherited directly from [LWP::UserAgent][8]. It allows you to blacklist the protocols you're unwilling to allow.

<pre>my $agent = WWW::Mechanize->new(
    protocols_forbidden => [ 'file', 'mailto', 'ssh', ] );
</pre>

This will prevent you from inadvertently following URLs like `file:///etc/passwd`

## Creating a Stricter Agent

If we put together all of these together we get something like:

<pre>my $agent = WWW::Mechanize->new(
    autocheck         => 1,
    cookie_jar        => HTTP::CookieJar::LWP->new,
    protocols_allowed => ['http','https',],
);
</pre>

Using these settings in conjunction with `strict_forms` can help you with debugging, security and also your own sanity.

## Making it Official

Much of what has been discussed here is now documented at <https://metacpan.org/pod/WWW::Mechanize#BEST-PRACTICES>. Edit: It has been pointed out to me that readers of this article may also benefit from my previous [UserAgent Debugging Made Easy][9] post.

## See Also

If [WWW::Mechanize][1] does not fit your use case, see also [WWW::Mechanize::Chrome][10], [WWW::Mechanize::Firefox][11], [WWW::Mechanize::Cached][12], [LWPx::UserAgent::Cached][13] and [Mojo::UserAgent][14].

 [1]: https://metacpan.org/pod/WWW::Mechanize
 [2]: https://metacpan.org/pod/HTML::Form
 [3]: https://metacpan.org/pod/Mozilla::PublicSuffix
 [4]: https://metacpan.org/pod/HTTP::CookieJar::LWP
 [5]: https://metacpan.org/pod/HTTP::CookieJar
 [6]: https://metacpan.org/pod/HTTP::Cookies
 [7]: https://metacpan.org/pod/HTTP::CookieJar#RFC-6265-vs-prior-standards
 [8]: https://metacpan.org/pod/LWP::UserAgent
 [9]: http://www.olafalders.com/2016/09/29/useragent-debugging-made-easy/
 [10]: https://metacpan.org/pod/WWW::Mechanize::Chrome
 [11]: https://metacpan.org/pod/WWW::Mechanize::Firefox
 [12]: https://metacpan.org/pod/WWW::Mechanize::Cached
 [13]: https://metacpan.org/pod/LWPx::UserAgent::Cached
 [14]: https://metacpan.org/pod/Mojo::UserAgent
