---
title: New defaults for Perl Linting in Vim’s Ale Plugin
author: oalders
type: post
date: 2018-02-28T20:47:25+00:00
url: /2018-02-28-new-defaults-for-perl-linting-in-vims-ale-plugin
categories:
  - Perl
  - Programming

---
In my previous post, I talked about [using Ale with vim for linting and syntax checking][1]. Since that time, the Ale defaults for Perl have changed. Perl::Critic checks are still on by default, but you will need to enable the syntax and compile checks that are run via the \`perl\` binary itself.

The reasoning for the new default is described [in the Ale docs][2]. If you want to (re-)enable your Perl checks, you can follow [the example in my dot files][3].

 [1]: http://www.olafalders.com/2017/10/17/vim-ale-syntastic-and-perlcritic/
 [2]: https://github.com/w0rp/ale/pull/1387/files
 [3]: https://github.com/oalders/dot-files/commit/13537b8a4aaac4129f10dffef8ecd021dfe74602
