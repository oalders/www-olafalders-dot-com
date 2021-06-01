---
title: Upgrading Business::PayPal::API
author: oalders
type: post
date: 2015-10-10T02:55:45+00:00
url: /2015/10/10/upgrading-businesspaypalapi
dsq_thread_id:
  - 4213300209
categories:
  - Perl

---
I got co-maint on [Business::PayPal::API][1] about 3 years ago in order to patch one line that was throwing a warning. The previous release had been 2 years prior to that. So it's fair to say that this module has not lately been on a rapid release cycle. It's still in use, though, and lately there has been some activity on rt.cpan.org related to it. So, I finally took an evening to sit down and try to cut a new release.

I got the bulk of the work done last night. I had been partially through a conversion to Dist::Zilla. I was able to finish that yesterday. This evening I finally got my head around how to get the tests running. It's a non-trivial process. 

There are a huge number of commits that I merged in for this latest release. All of the tests are passing except for one related to searching for "mass pay" payments. It's in [t/advanced/TransactionSearch.t](https://github.com/oalders/business-paypal-api/blob/master/t/advanced/TransactionSearch.t#L20). To be honest, that test failure doesn't concern me too much. I don't have a pile of time to invest in this at this point and my main concern is not breaking anything that involves sending and receiving payments. I'm also not sure when this test was actually last passing since most of the tests don't actually run when the module is installed. That all predates me.

I'm pragmatic enough to say that I can either try to fix this test at some point over the **next** 3 years or cut a new release now and get this thing out the door. I really do want to get this out into the wild. If it turns out there **is** an actual issue with the mass pay search, I hope someone will pitch in with a fix.

If you rely on this module, please consider giving [the TRIAL release](https://metacpan.org/release/OALDERS/Business-PayPal-API-0.71_02-TRIAL) a test run. [Pull requests are happily accepted](https://github.com/oalders/business-paypal-api).

If I've heard no complaints by Oct 15, 2015 I will make a proper release including these latest changes.

Edit: I just checked the current latest release and TransactionSearch.t fails there as well, so this test failure is at least 3 years old, which means it's not a blocker to putting out a new release.

 [1]: https://metacpan.org/pod/Business::PayPal::API
