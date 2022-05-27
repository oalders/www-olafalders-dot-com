+++
author="oalders"
date=2010-12-22T04:26:14+00:00
title="Expanding Your Author Info in the MetaCPAN"
type="post"
url="/2010/12/22/expanding-your-author-info-in-the-metacpan"
categories=[
  "cpan",
  "metacpan",
  "perl",
]
+++

If you\'ve had a look at
[search.metacpan.org](http://search.metacpan.org), you may have noticed
that some of the author pages have more info than you might find at
[search.cpan.org](http://search.cpan.org). Take, for instance, [FREW\'s
author page](http://search.metacpan.org/#/author/FREW). You\'ll see that
it has links to his blog, Twitter, StackOverflow, website etc. Lots of
information there which allows you to find his various online presences
without having to do all too much digging around.\
\
If you\'d like to expand your author info, it\'s pretty easy. We don\'t
have a login for you yet, but this is a trivially easy stop-gap solution
to get yourself up and running:\
\

-   Fork the [CPAN-API project](https://github.com/CPAN-API/cpan-api) on
    Github
-   Have a look at conf/author.json to get an idea of which fields you
    may want to add
-   Create an author.json file and save it to your author folder (eg
    conf/authors/O/OA/OALDERS/author.json)
-   Commit your changes and send a pull request

\
\
\
That\'s it. Once your pull request is in, we\'ll merge it and you\'ll be
included with the nightly run of the index.\
\
Now, a few more details about this. First off, have a look at some of
the other entries. You\'ll likely see that the sample file
(conf/author.json) has the most, so you can use this as a basis for your
own. Secondly, this is all just beta stuff, so don\'t feel restricted by
what you see. If you have other fields you want/need to add, please feel
free to do so. They won\'t immediately be included in the index, but
we\'ll have them there for reference and it will get us a better idea of
the kind of stuff people would like to include on their author pages.
Some suggestions to think about:\
\
\"accepts_donations\": \"0\|1\",\
\
\"paypal_address\": \"foo@bar.com\", \# if accepts_donations == 1\
\
\"donation_url\" : \"http://myfavouritecharity.com\",\
\
\"contact_with_job_offers\":\"0\|1\",\
\
\"country\" : \"US\",\
\
\"region\" : \"NY\",\
\
\"city\" : \"New York\",\
\
\
Feel free to be creative. Right now all you have in the CPAN index is
PAUSEID, name and email address. How do I find you on Twitter? Where do
you host your open source projects? In fact, think of what the CPAN-API
web service \*may\* eventually be used for and add your suggestions
accordingly.\
\
For instance, the API could be used to map authors by geographical
location. It could be used to find authors who are looking for work
(contract or otherwise). This work search may or may not be constrained
with geographical boundaries. Maybe the search will be cross-referenced
with authors on Github. Maybe with authors who have a lot of reputation
points on StackOverflow. How about authors of dists which have a CPAN
rating of 3 or greater? There are a lot of possibilities. These are just
a few. We\'d like to hear some more ideas.\
\
Eventually we\'d like to see the API as a warehouse for data on
everything an author cares to make public. Your lists of favourite (or
least favourite) modules. Lists of authors and modules you \"follow\" on
CPAN. Your list of bookmarked modules which you feel belong to \"best
practices\". All of this data could be used to make the CPAN a better,
more understandable place for both long time and new Perl authors. I\'ll
post more on our ideas later, but right now, I\'d like to ask you to
take 3 minutes out of your day and fork the project. If you don\'t have
a Github account and you\'d like to set one up, it\'s free and takes
just a few minutes to get set up. So please, let everyone know a little
bit more about yourself. :)

## Comments

Author: brian d foy

Date: 12/22/2010 02:09:30 PM

  I pushed my changes, but I imagine you'll have a deluge of merges and ultimately conflicts you have to handle by hand since everything is in one file.

I also broke out the one file into separate author files. If you need the one big file, you can make it out of the smaller files.

Maybe better, though, would be something that we could drop into our CPAN author directory so it's a well known location for the info despite any project. Too bad we can't upload the same filename more than once (yet).


---

Author: Olaf Alders

Date: 12/23/2010 03:54:53 AM

  I wasn't really thinking about resolving conflicts when I set the file up, but you raise a good point!  I've just merged your changes in, so we'll follow that format going forward.  I'll need to edit this post accordingly.


We're looking at setting up a proper authentication scheme, so that authors can log in and update their info in ElasticSearch directly, but it really would be great if that sort of info could be uploaded to CPAN into the author directory. I think, going forward, that would make a lot of sense. 


---

Author: Gábor Szabó - גאבור סבו

Date: 12/24/2010 12:10:52 PM

  What about author_\d+.json file on PAUSE? You can then pick the biggest number and use that info.

