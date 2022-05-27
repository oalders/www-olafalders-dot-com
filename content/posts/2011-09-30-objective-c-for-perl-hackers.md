+++
author="oalders"
date=2011-09-30T04:26:58+00:00
title="Objective-C for Perl Hackers"
type="post"
url="/2011/09/30/objective-c-for-perl-hackers"
categories=[
  "objective-c",
  "perl",
]
+++

I\'ve been messing around with Objective-C off and on for a while now.
Whenever I take a break and come back to it, I find myself having to
look up some of the same syntax over and over. Some examples would be:\
\
Perl:\

    $foo =~ s{bar}{baz}g;

\
\
Objective-C:\

    foo = [foo stringByReplacingOccurrencesOfString:@"bar" withString:@"baz"];

\
\
Perl:\

    $list{'foo'} = 'baz';

\
\
Objective-C:\

    [list setObject:baz forKey:@"foo"];

\
\
One thing in particular that gets me is the assigning a value to a
dictionary, like in the example above. Naming the value \*before\* the
key seems counter-intuitive to me. Luckily Xcode is great with
autocompletion, which makes a lot of this easier, but I still find I
need reference materials which are more Perlish. To make things easier
for myself, [I\'ve set up a
wiki](https://github.com/oalders/objective-c-for-perl-hackers/wiki) to
map Perl syntax to Objective-C where it makes sense.\
\
Feel free to edit/update/correct the wiki where you see fit. I make no
claims of expertise here, but I do find myself referring back to this
list and adding to it as I write my own Objective-C code.\
\
<https://github.com/oalders/objective-c-for-perl-hackers/wiki>.

## Comments

Author: :m)

Date: 10/01/2011 07:28:43 AM

  Thanks for this, very much appreciated!
Starting from january I am going to give myself a semester of c++ at school. So this comes quite timely for me. :-)


---

Author: Christopher Cashell

Date: 10/21/2011 05:54:27 AM

  Objective-C is one of the few languages I have never actually used. . . but please tell me that <code>stringByReplacingOccurrencesOfString</code> is a joke and not a real method/function name from what I assume is a standard library?

Seeing things like that makes me want to beat people over the head with their keyboards (specifically, people who come up with method/function/variable names like that).


---

Author: Olaf Alders

Date: 10/21/2011 08:57:26 PM

  I guess the idea is that it's supposed to read like English, but it ends up being verbose to the point that it's a bit off-putting.  Trimming whitespace is another good example:

foo = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

Concatenating a string, in particular, looks like total overkill:

fileName = [fileName stringByAppendingString:@".html"];

:)

