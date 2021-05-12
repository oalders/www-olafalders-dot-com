---
title: Getting to Travis and GitHub Pages Quickly
author: oalders
type: post
date: 2016-08-12T23:05:14+00:00
url: /2016-08-12-getting-to-travis-and-github-pages-quickly
dsq_thread_id:
  - 5064215573
categories:
  - Programming

---
Disclaimer: I'm sure this functionality exists elsewhere, but this was a fun little thing for me to work on. Also, you'll need a minimum of git 2.7 for this to work.

Often, when I'm working locally I like to bounce right over to a GitHub repository url to check something. I ended up writing a bit of code to make this easier. While I was at it, I decided it would be nice to have the same thing for Travis URLs. So, I've released this as part of [Git::Helpers][1].

When you're inside a Git repository, you can use [gh-open][2] to open a browser window with the GitHub URL of your repository. `gh-open` also accepts an origin name as an argument, so 

<pre>gh-open upstream</pre>

would open a tab in your default browser containing your upstream's URL, assuming you have an origin by that name. Don't specify a remote name and it will assume **origin**: 

<pre>gh-open</pre>

It doesn't currently care which branch you're on, but patches welcome (in the kindest sense of the expression).

If you want to check your Travis page for the repository then [travis-open][2] will do the same kind of thing. It also accepts an origin name, just as `gh-open` does: 

<pre>travis-open upstream</pre>

or defaults to origin if you don't: 

<pre>travis-open</pre>

 [1]: https://metacpan.org/pod/Git::Helpers
 [2]: https://metacpan.org/pod/distribution/Git-Helpers/bin/gh-open
