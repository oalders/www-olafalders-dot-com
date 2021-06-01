---
title: Managing Your Travis CI Config Files with App::CISetup
author: oalders
type: post
date: 2019-05-22T12:53:44+00:00
url: /2019/05/22/managing-your-travis-ci-config-files-with-appcisetup.md
categories:
  - Perl
  - Programming

---
This post is brought to you by ServerCentral Turing Group in Chicago, a Platinum level sponsor of the meta::hack conference in 2018. For the past 3 years we've had the privilege of having meta::hack at the ServerCentral office space in Chicago.

![][1]

ServerCentral Turing Group (SCTG) is a trusted provider of AWS consulting, managed clouds, cloud-native software development, and global data center services for startups, enterprises, and Fortune 500 companies.

# Managing Your Travis CI Config Files with App::CISetup

If you write software, you (hopefully) write tests. If you write tests, it's easy to forget to run them. Using Continuous Integration (CI) for your software is one way around this. Many of us use [Travis CI][2] for CI. In this post we'll go over ways to make your Travis CI faster and hopefully better.

## Setting Up a New Travis CI Config

Travis builds rely on a `.travis.yml` file which lives in the top level of your repository. There are several ways to set up a new config.

  * You can do it by hand
  * You can have [Dist::Zilla][3] create the file for you when you create a new distribution
  * You can use [App::CISetup][4]

I'm going to cover the last option here, since it's so easy and possibly the least known of the options mentioned above.

First, install the module: `cpanm App::CISetup`.

Then create a new config file: `setup-travis-yml.pl --create --dir .`

This will create a file which looks something like this:

```yaml
addons:
  apt:
    packages:
      - aspell
      - aspell-en
language: perl
perl:
  - blead
  - dev
  - 5.28
  - 5.26
  - 5.24
  - 5.22
  - 5.20
  - 5.18
  - 5.16
  - 5.14
cache:
  directories:
    - $HOME/perl5
matrix:
  allow_failures:
    - perl: blead
  fast_finish: 1
  include:
    - env: COVERAGE=1
      perl: 5.28
env:
  global:
    - AUTHOR_TESTING=1
    - RELEASE_TESTING=1
before_install:
  - eval $(curl https://travis-perl.github.io/init) --auto --always-upgrade-modules
### __app_cisetup__
# ---
# force_threaded_perls: 0
# perl_caching: 1

### __app_cisetup__
```

Let's break down some parts of this file to see what we can learn.

### addons

    ---
    addons:
      apt:
        packages:
          - aspell
          - aspell-en

What's going on here? The issue is that some Pod spelling tests will skip running tests if they don't find the proper dictionary files. If your tests are not running in verbose mode, you may not even know that tests are being skipped. So, this part of the setup ensures that there is an English dictionary available for spell checking. Obviously you can add other languages if your Pod needs this.

### cache

    cache:
      directories:
        - $HOME/perl5

In many test builds, installing your CPAN dependencies can add a lot of extra time to the total build time. This tells Travis to cache your module installs. Note that each Perl version which you test as a part of your Travis build does its own module install. So, if you're running 6 different jobs as part of a Travis build, you'll actually have 6 different caches. You don't have to worry about a cache from Perl 5.26 contaminating a cache for Perl 5.24.

### matrix

Now we're at the build matrix:

    matrix:
      allow_failures:
        - perl: blead
      fast_finish: 1
      include:
        - env: COVERAGE=1
          perl: &#039;5.28&#039;

We are going to allow some failures:

      allow_failures:
        - perl: blead

In the case of `blead` Perl we do care if something breaks, but we probably don't want to prevent any code from being merged because of a test failure from `blead`.

If you're wondering what `blead` is, it's explained at [dev.perl.org/perl5/source.html][5]

> The master branch, where the development takes places, is named blead

### fast_finish

    fast_finish: 1

Enabling `fast_finish` allows us to fail faster. [The Travis blog][6] explains it nicely:

> With fast finishing enabled, Travis CI will mark your build as finished as soon as one of two conditions are met: The only remaining jobs are allowed to fail, or a job has already failed. In these cases, the status of the build can already be determined, so there’s no need to wait around until the other jobs finish.

Basically, enabling `fast_finish` allows us to get faster notifications from Travis, if we have builds in the `allow_failures` section.

### include

This brings us to the build matrix includes:

      include:
        - env: COVERAGE=1
          perl: &#039;5.28&#039;

In this case we're saying that we want to run an additional build. We want to run an extra Perl 5.28 build that uses [Devel::Cover][7].

If we are going to run a coverage build, we'll likely also want to use [coveralls.io][8] to track changes to our coverage. Setting up Coveralls is outside the scope of this post, but if you haven't started using it yet, I highly recommend taking a few minutes to get set up with this service.

### env

Moving along, we can see that some global environment variables are being set.

    env:
      global:
        - AUTHOR_TESTING=1
        - RELEASE_TESTING=1

The above configuration ensures that author and release tests are run on all jobs in your build unless you override or unset these variables. Personally, I prefer to run release tests on just one job per build, but that's just me. I may eventually change my mind about that.

### before_install

The last configuration looks simple, but it does a lot:

    before_install:
      - eval $(curl https://travis-perl.github.io/init) --auto --always-upgrade-modules

The above ensures that your build uses the [Travis Perl Helpers][9], which does so much handy stuff I'll leave exploration of that as an exercise for the reader. I should note, however, that `--always-upgrade-modules` is enabled here, so even though we are caching our CPAN modules, Travis will automatically refresh our Perl module cache if it has gotten stale.

### `__app_cisetup__`

After that [APP::CISetup][10] tracks some of our choices as comments, so that Travis does not know or care about them:

    ### __app_cisetup__
    # ---
    # force_threaded_perls: 0
    # perl_caching: 1

    ### __app_cisetup__

Now, what's missing from our Travis config?

## sudo: false

Remember when you added `sudo: false` to all of your Travis builds so that they would build faster? [That's no longer a thing][11], so [App::CISetup][4] helpfully removes this for you.

## Updating a .travis.yml file

In future you can run `setup-travis-yml.pl --dir .` as many times as you'd like. (Note that this is not exactly the same command that we used earlier, since we have dropped the `--create`.) This will increment your Perl versions as new versions become available. This will also remove `sudo: false` from any config files which currently contain this option. Try running this on your existing `.travis.yml` files to see what happens.

## Doing it Manually

All of the above can also be achieved by making these configurations by hand. Using `App::CISetup` is not for everyone. You may, for example, not want your YAML to be rewritten by a script which is outside of your direct control. Maybe you want things ordered in a certain way. Maybe you don't want to test on the latest version(s) of Perl. However you decide to manage your config files, I hope you've found some useful information here.

## Caveats

At some point after I began writing this post and before I finished [Travis CI was acquired][12]. I won't get into the specifics as I'm not close to the situation but as with any change of ownership, but it's something to be aware of.

Happy testing!

 [1]: https://www.servercentral.com/wp-content/uploads/2018/12/SCTG-Logo.png
 [2]: https://travis-ci.org
 [3]: https://metacpan.org/pod/Dist::Zilla
 [4]: https://metacpan.org/pod/App::CISetup
 [5]: https://dev.perl.org/perl5/source.html
 [6]: https://blog.travis-ci.com/2013-11-27-fast-finishing-builds
 [7]: https://metacpan.org/pod/Devel::Cover
 [8]: https://coveralls.io/
 [9]: https://travis-perl.github.io
 [10]: https://metacpan.org/pod/APP::CISetup
 [11]: https://blog.travis-ci.com/2018-11-19-required-linux-infrastructure-migration
 [12]: https://blog.travis-ci.com/2019-01-23-travis-ci-joins-idera-inc
