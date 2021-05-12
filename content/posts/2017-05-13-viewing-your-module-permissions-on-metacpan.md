---
title: Viewing Your Module Permissions on MetaCPAN
author: oalders
type: post
date: 2017-05-13T08:45:18+00:00
url: /2017-05-13-viewing-your-module-permissions-on-metacpan
categories:
  - MetaCPAN
  - Perl
  - Programming

---
We're currently at the Perl Toolchain Summit in Lyon, working hard on improving MetaCPAN. One feature which we went live with yesterday is a view on CPAN module permissions. This means that you can now easily see which modules any CPAN author has permission to upload.

If you want to see every module which Neil Bowers has permissions on, you can go to <https://metacpan.org/permission/author/NEILB>. You can get to this page via the **module permissions** link on the left sidebar of [a MetaCPAN author page][1].

To see who has permissions to upload a particular module, you can use [the module view][2]. This is not yet linked from MetaCPAN pages.

To see who has permissions to upload a particular distribution, you can use [the distribution view][3]. You can get to this page via the **upload permissions** link on the left sidebar of [a MetaCPAN release page][4].

This new feature is helpful in a couple of ways. Firstly, if you're looking for someone to patch and release a module for you, you can now easily view **everyone** who has permissions to do this. It's tempting to believe that the last person who released a module is responsible for it, but the reality is that in many cases there are several people who can upload a new release. This helps shift the burden from one person to multiple people in many cases. In practice, if you want to chase someone to upload a new version of module X, you now can easily find the canonical list of responsible people.

Secondly, if you would like permission to begin uploading a certain module, you can now easily find the module owner. Only the module owner can assign co-maint to you. In the past I've made the mistake of contacting the last uploader and asking for co-maint. What I should have done is contact the person who actually is the owner. This can save you some running around trying to contact folks and waiting for replies from the wrong people.

Lastly, you can now audit module permissions. You may notice when looking at permissions that there are authors who should not have co-maint on a module. Or you may notice that authors have co-maint on some modules in a distribution but not on others. Having inconsistent permissions on modules in a release can lead to problems when a distribution is released by an author who has some missing permissions.

So, please do have a look at your permissions and give them a sanity check. If you notice a problem with a module which you don't own, contact the PAUSE admins at <modules@perl.org> and they'll be happy to work with you to sort out the correct permissions.

 [1]: https://metacpan.org/author/NEILB
 [2]: https://metacpan.org/permission/module/Moose
 [3]: https://metacpan.org/permission/distribution/Moose
 [4]: https://metacpan.org/release/Moose
