---
title: perlimports
author: oalders
type: post
date: 2021-06-11T00:00:00+00:00
url: /2021/06/12/perlimports
categories:
  - Go
  - Perl
  - Programming

---

Over the past 6 months or so, I've been working on a project to port [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) (or some version of it) to Perl. By now I've tested it on our Perl codebase at $work, on MetaCPAN and also some CPAN modules. It's now at a state where I can say it's getting to be a useful tool.

You can find perlimports on [MetaCPAN](https://metacpan.org/pod/perlimports) and [GitHub](https://github.com/oalders/App-perlimports).

For a more thorough introduction, see [my talk](https://www.youtube.com/watch?v=fKqxdTbGxYY) from the Perl and Raku Conference this past week. 

To view the slides:

```
curl https://raw.githubusercontent.com/oalders/presentations/main/slides/6-perlimports/remark.html -o perlimports.html && open perlimports.html
```

You can also see an example of what `perlimports` does, [via this pull request](https://github.com/Perl-Critic/Perl-Critic/pull/953/files) on the `Perl::Critic` repository.
