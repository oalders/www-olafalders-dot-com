---
title: Stop Writing Your Own Commify Functions
author: oalders
type: post
date: 2015-09-04T03:42:31+00:00
url: /2015/09/04/stop-writing-your-own-commify-functions
dsq_thread_id:
  - 4095855809
categories:
  - Perl

---
Writing your own commify function may well be right up there with writing your own web framework or templating system. Most of us have done it and it probably wasn't worth the effort. Enter [CLDR::Number][1]. (I should note here that it's not obvious from the name that this module will commify for you -- that's one of the reasons I'm writing this up.)

Let's see if we can do this:

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );
use utf8::all;

use CLDR::Number;

foreach my $locale ( 'de', 'en', 'fr', 'es', 'ja', 'ru', 'pt', 'zh', ) {
    my $cldr = CLDR::Number->new( locale => $locale );
    my $decf = $cldr->decimal_formatter;

    say $locale, "\t", $decf->format( 12345 );
}
```

Easy, right? Not only does [CLDR::Number][1] handle commification (is that a word?) -- it also does this correctly for various locales. If you're trying to internationalize your application, this can save you a lot of time. Let's look at the output:

```
de	12.345
en	12,345
fr	12 345
es	12 345
ja	12,345
ru	12 345
pt	12.345
zh	12,345
```

You can see that the differences are significant enough that you don't want to re-invent this wheel. The fact that we're using a "Decimal" formatter here is a bit misleading. It'll handle whole numbers just fine.

Let's try it with some digits after the decimal place, though.

```
de	12.345,67
en	12,345.67
fr	12 345,67
es	12 345,67
ja	12,345.67
ru	12 345,67
pt	12.345,67
zh	12,345.67
```

That works nicely as well.

Now, did I mention that this distribution includes a couple of other formatters? Let's look at currency. That's another tricky one.

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );
use utf8::all;

use CLDR::Number;

foreach my $locale ( 'de', 'en', 'fr', 'es', 'ja', 'ru', 'pt', 'zh', ) {
    my $cldr = CLDR::Number->new( locale => $locale );
    my $curf = $cldr->currency_formatter(currency_code => 'USD');

    say $locale, "\t", $curf->format( 12345.67 );
}
```

The output is:

```
de	12.345,67 $
en	$12,345.67
fr	12 345,67 $US
es	12 345,67 $
ja	$12,345.67
ru	12 345,67 $
pt	US$12.345,67
zh	US$ 12,345.67
```

Crazy, right? I had no idea that representing a price in USD could vary so wildly across locales.

Let's have a look at the last formatter, then.

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );
use utf8::all;

use CLDR::Number;

foreach my $locale ( 'de', 'en', 'fr', 'es', 'ja', 'ru', 'pt', 'zh', ) {
    my $cldr = CLDR::Number->new( locale => $locale );
    my $perf = $cldr->percent_formatter;

    say $locale, "\t", $perf->format( 0.1234 );
}
```

The output looks like:

```
de	12 %
en	12%
fr	12 %
es	12%
ja	12%
ru	12 %
pt	12%
zh	12%
```

We can see here that the percent formatter rounds to the nearest percent by default. We can change that with an argument when creating the formatter.

<pre class="">my $perf = $cldr->percent_formatter( maximum_fraction_digits => 1 );
</pre>

Our output will then look like:

```
de	12,3 %
en	12.3%
fr	12,3 %
es	12,3%
ja	12.3%
ru	12,3 %
pt	12,3%
zh	12.3%
```

I could expand on the various arguments a bit more, but this is the gist of it. This is an extremely handy module which saves you from writing your own formatters and makes it easy for you to keep folks across the globe happy with your internationalization efforts.

I've personally already gotten a lot of use out of this code . May thanks to [Nova Patch][2] and [Shutterstock][3] for releasing it!

## Addendum: Choosing the most specific locale

After I originally published this post, [Tom Legrady][4] was kind enough to reach out to me to say that relying on "en" as a locale may not always be what you want.  Consider the case of currency.  Let's tweak our example to display various "en" locales.

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );
use utf8::all;

use CLDR::Number;

my @en_locales = (
    'en_AU', 'en_BZ', 'en_CA', 'en_CB', 'en_GB', 'en_IN', 'en_IE', 'en_JM',
    'en_NZ', 'en_PH', 'en_ZA', 'en_TT', 'en_US'
);

my %formats;
foreach my $locale ( @en_locales ) {
    my $cldr = CLDR::Number->new( locale => $locale );
    my $curf = $cldr->currency_formatter( currency_code => 'USD' );

    say $locale, "\t", $curf->format( 12345.67 );
}
```

Let's have a look at the results:

```
en_AU	US$12,345.67
en_BZ	US$12,345.67
en_CA	US$12,345.67
en_CB	$12,345.67
en_GB	$12,345.67
en_IN	US$ 12,345.67
en_IE	$12,345.67
en_JM	US$12,345.67
en_NZ	US$12,345.67
en_PH	US$12,345.67
en_ZA	US$12 345,67
en_TT	US$12,345.67
en_US	$12,345.67
```

If you look closely, you'll see 4 distinct currency formats just across various "en" locales. I've sorted them by popularity across the various locales. (I should note that I was surprised at the outcome.)

```perl
{
    US$12,345.67    => 7,
    $12,345.67      => 4,
    US$ 12,345.67   => 1,
    US$12 345,67    => 1,
}
```

So, if you can get to the most specific, correct locale for a user, it probably makes sense to use that locale. Thanks, Tom!

 [1]: https://metacpan.org/pod/CLDR::Number
 [2]: https://metacpan.org/author/PATCH
 [3]: http://www.shutterstock.com/
 [4]: https://twitter.com/tomlegrady
