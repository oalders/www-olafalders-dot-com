---
title: "Finding Unused Perl Variables"
type: post
author: oalders
date: 2022-02-22T12:45:11-05:00
url: "2022/02/22/finding-unused-perl-variables"
categories:
  - perl
  - linting
tags:
  - perl
  - linting
description: "Find unused variables and make your code less confusing."
summary: "When you find variables which have not been used, you may find yourself asking, \"why is this here?\" and you may not easily get an answer. Eliminating unused variables can be good for the performance of the code, but also good for everyone else on your team. So, we want to make sure we can remove old bits of unused code and also prevent new cases."
toc: false
thumbnail:
images: []
draft: false
---
## The Problem

I've been working on some linting projects at $work and one thing I'm working
on is finding unused variables in our codebase. This can be pretty important in
a larger codebase. When you find variables which have not been used, you may
find yourself asking, "why is this here?" and you may not easily get an answer.
Eliminating unused variables can be good for the performance of the code, but
also good for everyone else on your team. So, we want to make sure we can
remove old bits of unused code and also prevent new cases.

One tool we have used for this is [Test::Vars](https://metacpan.org/pod/Test::Vars). It has some limitations (like it needs to be in a file with a `package` declaration) and it has some bugs, but it does find some unused variables as well.

## App::perlvars

As part of this work, I have released [App::perlvars](https://metacpan.org/pod/App::perlvars). It's simple to use. Just install the module and then run it on the `.pm` files in your code:

```perl
find lib | grep pm$ | xargs perlvars
```

You can exclude arbitrary variables so that they don't get flagged. See the documentation for more info on that.

## Variables::ProhibitUnusedVarsStricter

If you use [Perl::Critic](https://metacpan.org/pod/Perl::Critic), I highly
encourage you to look at
[Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter](https://metacpan.org/pod/Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter)
as well. This may be an even better solution, or you may find that using both
tools gives you the maximum benefit. To start with, you can try something like
this:

```bash
perlcritic --single-policy Variables::ProhibitUnusedVarsStricter lib
```

## Test::Vars

Added to this, you can also use [Test::Vars](https://metacpan.org/pod/Test::Vars) directly as part of your test suite.

## Code::TidyAll::Plugin::Test::Vars

If you're a [tidyall](https://metacpan.org/pod/tidyall) user, I encourage you
to look at
[Code::TidyAll::Plugin::Test::Vars](https://metacpan.org/pod/Code::TidyAll::Plugin::Test::Vars).
While you're at it, enable the
[Code::TidyAll::Plugin::PerlCritic](https://metacpan.org/pod/Code::TidyAll::Plugin::PerlCritic)
plugin, add
[Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter](https://metacpan.org/pod/Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter)
to your `.perlcriticrc` and you'll have maximum unused variable checks.

## Test::Code::TidyAll

Once you're using [tidyall](https://metacpan.org/pod/tidyall), you can use
[Test::Code::TidyAll](https://metacpan.org/pod/Test::Code::TidyAll) to ensure
code quality within your test suite.
[Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) users can also do this via
[Dist::Zilla::Plugin::Test::TidyAll](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::TidyAll).

This leaves you with plenty of options for code quality checks in general and
for finding unused variables in particular.
