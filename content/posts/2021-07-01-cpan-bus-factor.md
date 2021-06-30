---
title: CPAN Bus Factor
author: oalders
type: post
date: 2021-07-01T00:00:00+00:00
url: /2021/07/01/cpan-bus-factor
categories:
  - Perl
  - Programming
  - CPAN
  - MetaCPAN

---

# CPAN Bus Factor

## What is "bus factor"?

[Wikipedia](https://en.wikipedia.org/wiki/Bus_factor) defines "bus factor" as 

> a measurement of the risk resulting from information and capabilities not being shared among team members, derived from the phrase "in case they get hit by a bus."

For CPAN our definition is "a measurement of how risky it might be to start relying on a CPAN module, which might not be actively maintained".

## CPAN terminology

Let's say you've created a new module for exceptions, called Exception::Yoda ("there is no try"). If that name has never been used on CPAN before, when you do your first upload to PAUSE, you will be given the first-come indexing permission on `Exception::Yoda`. This means that PAUSE will include your releases of that module in the CPAN Index.

The CPAN Index maps module names to tarballs in author directories. When someone runs `cpan Exception::Yoda`, their CPAN client looks for the module name in the CPAN Index, and if found, it downloads the associated tarball, and tries to install it.

If anyone else tries to upload a module called `Exception::Yoda`, PAUSE will see that you're the only person with an indexing permission, and their version won't be added to the CPAN Index.

Jedi exception handling takes off, lots of people start using your module, and Luke starts helping out. You give them the co-maint indexing permission on `Exception::Yoda`, which means that Luke's uploads will also be listed in the CPAN Index.

Now there are two of you who can do releases. So if you get busy on a work project, take a long vacation, or lose interest, Luke can field any bug reports and release new versions.


## Reliability indicators for CPAN distributions

For many tasks there are multiple modules on CPAN to choose between. What criteria should you use to select one to rely on? There are a number that are well established:

* Does it provide the function(s) you need, and are they correct? Related: is the testsuite up to scratch?
* The relative performance of the different modules. Some years back I reviewed a number of collections of modules for the same task. In most cases I found three orders of magnitude difference between the fastest and slowest.
* How many other CPAN distributions do they use? For a `::Tiny` module that might be zero, but it could be a lot more. You think you're adding one dependency to your work stack, but in reality you could be adding a lot more.
* How many other CPAN distributions rely on the module in question? This can range from zero to tens of thousands. The model for this is called the River of CPAN, and MetaCPAN will show you the "river position" (number of downstream dependencies) when you look at a module / distribution.

We think you should also consider how well the distribution is maintained. There are a number of factors to this, but a key one is: if you find a bug and report it, how likely is it that the bug will be fixed and a new version released to CPAN? Otherwise you might find yourself maintaining your own patched version, which can become a pain. Olaf thought that a "CPAN bus factor" might be a useful measure here.

## CPAN Bus Factor

We want a measure that tells us how likely it is that a new release of a distribution will happen.

### Naive definition

A simple measure, that's relatively easy to calculate, is how many people have indexing permissions. For our example earlier, there's +1 for the first-come permission, and another +1 for Luke, so that's a bus factor of 2.

But if we consider how things have evolved on CPAN over the last 26 years, it becomes clear that this isn't a good enough definition. There are many modules that are on their 2nd, 3rd, or 4th maintainer. The original author loses interest, either in the distribution, or perhaps in Perl altogether. This latter often happens if the original author changes jobs. Someone else comes along and wants to release some bug fixes. The PAUSE admins have a well defined process for handling this, which typically results in the new maintainer being given co-maint. That person may in turn move on, and eventually a second person is given co-maint.

In the example just above, the module looks to have a bus factor of 3, but two of them may have lost interest in CPAN years ago.

### A more realistic definition
We want our bus factor to be the number of active potential releasers that a distribution has.

We propose the following definition

> The bus factor for a CPAN distribution is the number of people with an indexing permission on the distribution, who have released something to CPAN within the last 2 years.

Here are some typical examples:

* Someone creates a module and releases it to CPAN, then they never release it again, and they haven't released anything else. Their distribution starts off with a bus factor of 1, and two years later the bus factor drops to 0.
* Some years later, another person comes along and gets co-maint on the distribution, and does a new release. The bus factor goes back up to 1.
* A third person starts using the distribution, reports some bugs and has some email with the new maintainer. They're given co-maint. They also have their own distributions, which they regularly release. Even though they haven't released our example distribution yet, the bus factor goes up to 2.

### Dual-life modules
A dual-life module is one that is a core module (i.e. shipped with Perl itself), but also has independent releases to CPAN. By definition, a core module is looked after by p5p, so we give dual-life modules a minimum bus factor of 5. 
