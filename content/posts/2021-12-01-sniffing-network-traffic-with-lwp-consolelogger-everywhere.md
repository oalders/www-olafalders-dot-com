---
title: Observing Network Traffic with LWP::ConsoleLogger::Everywhere
author: oalders
type: post
date: 2021-11-30T00:00:00+00:00
url: /2021/12/01/observing-network-traffic-with-lwp-consolelogger-everywhere
categories:
  - Perl
  - Programming
  - LWP::ConsoleLogger
  - CPAN

---

# Sniffing Network Traffic with LWP::ConsoleLogger::Everywhere

## The Problem

Today an interesting question came up about whether or not [Carton](https://metacpan.org/pod/Carton) uses HTTPS and also which CPAN mirror it downloads from. For background see [https://blog.hackeriet.no/cpan-signature-verification-vulnerabilities/](https://blog.hackeriet.no/cpan-signature-verification-vulnerabilities/) and [http://blogs.perl.org/users/neilb/2021/11/addressing-cpan-vulnerabilities-related-to-checksums.html](http://blogs.perl.org/users/neilb/2021/11/addressing-cpan-vulnerabilities-related-to-checksums.html).

To find the answer, I had a quick look at [Carton's dependencies](https://metacpan.org/pod/Carton). They led me to [Menlo::CLI::Compat](https://metacpan.org/pod/Menlo::CLI::Compat). I then poked at Menlo for a bit, but the answer wasn't immediately obvious to me. I wondered if [LWP::ConsoleLogger::Everywhere](https://metacpan.org/pod/LWP::ConsoleLogger::Everywhere) could be helpful.

### The Commands

```bash
git clone git@github.com:perl-carton/carton.git
cd carton/
perl -Ilib -MLWP::ConsoleLogger::Everywhere script/carton install
```

### The Output

```bash
Installing modules using /Users/olafalders/Documents/github/carton/cpanfile
GET http://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Capture-Tiny-0.48.tar.gz

.---------------------------------+--------------.
| Request (before sending) Header | Value        |
+---------------------------------+--------------+
| User-Agent                      | Menlo/1.9019 |
'---------------------------------+--------------'
```

What we've done above is:

1) `git clone` the Carton repository. I've done this just to get the latest version of the Carton code and also to get a repository which includes a `cpanfile`.

2) Run `script/carton install`. If you run this script without any arguments it will default to installing modules in a `./local` folder. I've included the `install` subcommand for clarity.

3) Pass `-MLWP::ConsoleLogger::Everywhere` as command line switch when running `script/carton`. This invokes [LWP::ConsoleLogger::Everywhere](https://metacpan.org/pod/LWP::ConsoleLogger::Everywhere) and allows network calls made via [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) or one of its subclasses to be printed to the console.


### Key Takeways

1) `carton` defaults to using HTTP, not HTTPS. We can see this in the `GET` request to `http://cpan.metacpan.org`.

2) `carton` uses the `cpan.metacpan.org` mirror, which is a trusted mirror.

## Forcing a Mirror URL

So, how do we force Carton to use a specific mirror and/or protocol? We can do this via the `PERL_CARTON_MIRROR` environment variable.

### The Commands

```bash
PERL_CARTON_MIRROR="https://cpan.metacpan.org" \
	perl -MLWP::ConsoleLogger::Everywhere -Ilib script/carton install
```


### The Output

```bash
GET https://cpan.metacpan.org/modules/02packages.details.txt.gz

.---------------------------------+--------------.
| Request (before sending) Header | Value        |
+---------------------------------+--------------+
| User-Agent                      | Menlo/1.9019 |
'---------------------------------+--------------'

...

GET https://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.120.tar.gz
```

### Key Takeaways

We can see from the above that both `02packages.details.txt.gz` and `Path-Tiny-0.120.tar.gz` have been downloaded from [https://cpan.metacpan.org](https://cpan.metacpan.org). We can also be confident that there were no typos in the environment variable name and that Carton is respecting our use of this variable.

There are certainly other ways of doing this, like using [a different tool](https://www.wireshark.org/) to sniff all network traffic, but this solution gets us to the right place with very little overhead. What I also like about this approach is that we don't have to edit any of Carton's code in order to get the output which we are looking for.

## TIMTOWDI

If you want to do this with a `carton` (or another other script) which is already in your path, you can use the `PERL5OPT` environment variable. In that case, the first command would have looked something like:


```bash
cd /dir/which/contains/cpanfile
PERL5OPT="-MLWP::ConsoleLogger::Everywhere" carton install
```

Combining this with the `PERL_CARTON_MIRROR` environment variable, we'd have something like:


```bash
PERL_CARTON_MIRROR="https://cpan.metacpan.org" \
PERL5OPT="-MLWP::ConsoleLogger::Everywhere"    \
    carton install
```

## Thanks, Julien!

Many thanks to [Julien Fiegehenn](https://metacpan.org/author/SIMBABQUE) for contributing the [LWP::ConsoleLogger::Everywhere](https://metacpan.org/pod/LWP::ConsoleLogger::Everywhere) module.
