---
title: UserAgent Debugging Made Easy
author: oalders
type: post
date: 2016-09-29T02:28:50+00:00
url: /2016/09/29/useragent-debugging-made-easy
dsq_thread_id:
  - 5202397902
categories:
  - Perl

---
Earlier today I saw [a recent blog post][1] from [Gabor Szabo][2]. In it, he shows a very concise way to handle Basic Authentication using [LWP::UserAgent][3]. Now, what if you had a problem running the script? How might you go about debugging it? You could add a bunch of print statements. Maybe dump the request and the response objects. That's entirely valid, but I want to show you a slightly simpler way of going about it, using [LWP::ConsoleLogger::Easy][4].

Gabor's original script looks like this:

```perl
use strict;
use warnings;
use v5.10;
use LWP::UserAgent;
use HTTP::Request::Common;
 
my $ua = LWP::UserAgent->new();
my $request = GET 'https://pause.perl.org/pause/authenquery';
 
$request->authorization_basic('szabgab', '*******');
 
my $response = $ua->request($request);
say $response->as_string();
```

Let's run it to see what the output looks like.

```perl
olaf$ perl gabor.pl
HTTP/1.0 401 Unauthorized
Connection: close
Date: Thu, 29 Sep 2016 02:07:34 GMT
WWW-Authenticate: Basic realm="PAUSE"
Content-Length: 22
Content-Type: text/plain
Client-Date: Thu, 29 Sep 2016 02:07:34 GMT
Client-Peer: 207.171.7.119:443
Client-Response-Num: 1
Client-SSL-Cert-Issuer: /C=US/O=GeoTrust, Inc./CN=RapidSSL CA
Client-SSL-Cert-Subject: /serialNumber=K6R2GP4nh37grllJm9PZlQm0SS-oSNZ4/C=DE/O=pause.perl.org/OU=GT38611495/OU=See www.rapidssl.com/resources/cps (c)11/OU=Domain Control Validated - RapidSSL(R)/CN=pause.perl.org
Client-SSL-Cipher: AES128-GCM-SHA256
Client-SSL-Socket-Class: IO::Socket::SSL

Authorization required
```

Here's the debugging version. Note the important changes are on lines 4 and 9.

```perl
use strict;
use warnings;
use v5.10;
use LWP::ConsoleLogger::Easy qw( debug_ua );
use LWP::UserAgent;
use HTTP::Request::Common;

my $ua      = LWP::UserAgent->new();
debug_ua( $ua );
my $request = GET 'https://pause.perl.org/pause/authenquery';

$request->authorization_basic( 'szabgab', '*******' );

my $response = $ua->request($request);
```

The output we get is:

```perl
olaf$ perl basic-authentication.pl
GET https://pause.perl.org/pause/authenquery

.----------------+----------------------------.
| Request Header | Value                      |
+----------------+----------------------------+
| Authorization  | Basic c3phYmdhYjoqKioqKioq |
| User-Agent     | libwww-perl/6.15           |
'----------------+----------------------------'

==> 401 Unauthorized

.-------------------------+-----------------------------------------------------------------------------------------.
| Response Header         | Value                                                                                   |
+-------------------------+-----------------------------------------------------------------------------------------+
| Client-Date             | Thu, 29 Sep 2016 01:54:23 GMT                                                           |
| Client-Peer             | 207.171.7.119:443                                                                       |
| Client-Response-Num     | 1                                                                                       |
| Client-SSL-Cert-Issuer  | /C=US/O=GeoTrust, Inc./CN=RapidSSL CA                                                   |
| Client-SSL-Cert-Subject | /serialNumber=K6R2GP4nh37grllJm9PZlQm0SS-oSNZ4/C=DE/O=pause.perl.org/OU=GT38611495/OU=- |
|                         | See www.rapidssl.com/resources/cps (c)11/OU=Domain Control Validated - RapidSSL(R)/CN=- |
|                         | pause.perl.org                                                                          |
| Client-SSL-Cipher       | AES128-GCM-SHA256                                                                       |
| Client-SSL-Socket-Class | IO::Socket::SSL                                                                         |
| Connection              | close                                                                                   |
| Content-Length          | 22                                                                                      |
| Content-Type            | text/plain                                                                              |
| Date                    | Thu, 29 Sep 2016 01:54:23 GMT                                                           |
| WWW-Authenticate        | Basic realm="PAUSE"                                                                     |
'-------------------------+-----------------------------------------------------------------------------------------'

.------------------------.
| Content                |
+------------------------+
| Authorization required |
'------------------------'

.------------------------.
| Text                   |
+------------------------+
| Authorization required |
'------------------------'
```

You can see that the debugging version is just one line longer. I added 2 lines and removed a print statement. It prints out a whole pile of (nicely?) formatted information. Let's try running it with valid credentials. (Brace yourself, there's going to be a lot of output.)

```
olaf$ LWPCL_REDACT_HEADERS='Authorization' perl basic-authentication.pl
GET https://pause.perl.org/pause/authenquery

.----------------+------------------.
| Request Header | Value            |
+----------------+------------------+
| Authorization  | [REDACTED]       |
| User-Agent     | libwww-perl/6.15 |
'----------------+------------------'

==> 200 OK

.-------------------------+-----------------------------------------------------------------------------------------.
| Response Header         | Value                                                                                   |
+-------------------------+-----------------------------------------------------------------------------------------+
| Cache-Control           | no-cache                                                                                |
| Client-Date             | Thu, 29 Sep 2016 02:06:02 GMT                                                           |
| Client-Peer             | 207.171.7.119:443                                                                       |
| Client-Response-Num     | 1                                                                                       |
| Client-SSL-Cert-Issuer  | /C=US/O=GeoTrust, Inc./CN=RapidSSL CA                                                   |
| Client-SSL-Cert-Subject | /serialNumber=K6R2GP4nh37grllJm9PZlQm0SS-oSNZ4/C=DE/O=pause.perl.org/OU=GT38611495/OU=- |
|                         | See www.rapidssl.com/resources/cps (c)11/OU=Domain Control Validated - RapidSSL(R)/CN=- |
|                         | pause.perl.org                                                                          |
| Client-SSL-Cipher       | AES128-GCM-SHA256                                                                       |
| Client-SSL-Socket-Class | IO::Socket::SSL                                                                         |
| Connection              | close                                                                                   |
| Content-Length          | 11251                                                                                   |
| Content-Type            | text/html; charset=utf-8                                                                |
| Date                    | Thu, 29 Sep 2016 02:06:02 GMT                                                           |
| Last-Modified           | Thu, 29 Sep 2016 02:06:02 GMT                                                           |
| Link                    | &lt;/pause/pause_favicon.jpg>; rel="shortcut icon"; type="image/jpeg", &lt;/pause/pause.css>- |
|                         | ; rel="stylesheet"; title="pause"; type="text/css"                                      |
| Pragma                  | no-cache                                                                                |
| Title                   | PAUSE: menu                                                                             |
| Vary                    | accept-encoding                                                                         |
'-------------------------+-----------------------------------------------------------------------------------------'

.-------------------------------------------------------------------------------------------------------------------.
| Content                                                                                                           |
+-------------------------------------------------------------------------------------------------------------------+
| <?xml version="1.0" encoding="UTF-8"?>&lt;body bgcolor="white" link="#0000CC" vlink="#0000BB"                                                       |
|  alink="#FF0000" text="#000000">&lt;table width="100%" border="0"                                                    |
|  cellpadding="0" cellspacing="0">

<tr>
  <td valign="middle">
    <a href="authenquery">&lt;img loading="lazy" src="/pause/pause2.jpg"       |
    |  border="0" alt="PAUSE Logo"                                                                                      |
    |  width="177" height="43" align="left" /></a>
  </td>
  
  <td nowrap="nowrap">
    &lt;h4                                          |
    |   style="margin: 0 0 0 0; padding: 0 1em;">The [Perl programming] Authors Upload                                  |
    |   Server&lt;/h4>
  </td>
  
  <td align="right" style="width: 100%;">
    <table  cellpadding="3" cellspacing="0">
      <tr>
        <td class="- |
| statusencr" nowrap="nowrap">
          OALDERS &lt;olaf@wundersolutions.com&gt;<br />encrypted session
        </td>
      </tr>
    </table>     |
    | 
  </td>
</tr>&lt;/table>

<br />

<hr noshade="noshade" />

<table width="100%">
  |
  |       
  
  <tr>
    |
    |        
    
    <td>
      &#160;
    </td>                                                                                            |
    |        
    
    <td width="100%" valign="top" align="center">
      <div class="xexplain">
        Rev: 1071.02
      </div>
    </td>                 |
    |        
    
    <td valign="top">
      <div class="xexplain" align="right">
        To validate, download page first.
      </div>
      
      <br />
    </td>    |
    |       
  </tr>                                                                                                       |
  |       
  
  <tr>
    |
    |        
    
    <td width="100%">
      
    </td>                                                                                     |
    |        
    
    <td>
      |
      |         <a href="http://jigsaw.w3.org/css-validator/">&lt;img loading="lazy"                                                        |
      |            src="/pause/vcss.gif"                                                                                  |
      |            alt="Valid CSS!" height="31" width="88" /></a>                                                         |
      |        
    </td>                                                                                                      |
    |        
    
    <td>
      |
      |         <a href="http://validator.w3.org/file-upload.html">                                                       |
      |          &lt;img loading="lazy" src="/pause/valid-xhtml10.gif"                                                                      |
      |            alt="Valid XHTML 1.0!" height="31" width="88" />                                                       |
      |         </a>                                                                                                      |
      |        
    </td>                                                                                                      |
    |       
  </tr>                                                                                                       |
  |      
</table>                                                                                                     |
| &lt;/body>                                                                                                    |
'-------------------------------------------------------------------------------------------------------------------'

.-------------------------------------------------------------------------------------------------------------------.
| Text                                                                                                              |
+-------------------------------------------------------------------------------------------------------------------+
| PAUSE: menu The [Perl programming] Authors Upload ServerOALDERS &lt;olaf@wundersolutions.com&gt;encrypted sessio- |
| n Public menuRequest PAUSE account About PAUSE On The Naming of Modules PAUSE News PAUSE History Imprint/Impress- |
| um List of pumpkins User menuFiles Upload a file to CPAN Show my files Repair a Pending Upload Delete Files Perm- |
| issions View Permissions Change Permissions Utils Force Reindexing Reset Version Tail Daemon Logfile Account Edi- |
| t Account Info Change Password About Logging Out &#160; Hi Olaf Alders,please choose an action from the menu. Th- |
| e usermenu to the left shows all menus available to you, the table below shows descriptions for all menues avail- |
| able to anybody on PAUSE. ActionGroupDescription Request PAUSE accountpublicApply for a PAUSE account. Forgot Pa- |
| ssword?publicA passwordmailer that sends you a password that enables you to set a new password. About PAUSEpubli- |
| cSame as modules/04pause.html on any CPAN server On The Naming of ModulespublicA couple of suggestions that hope- |
| fully get you on track PAUSE NewspublicWhat's going on on PAUSE PAUSE HistorypublicOld News Imprint/Impressumpub- |
| licN/A List of pumpkinspublicA list, also available as YAML Upload a file to CPANuserThis is the heart of the Up- |
| load Server, the page most heavily used on PAUSE. Show my filesuserfind . -ls resemblance Repair a Pending Uploa- |
| duserWhen an upload you requested hangs for some reason, you can go here and edit the file to be uploaded. Delet- |
| e FilesuserSchedule files for deletion. There is a delay until the deletion really happens. Until then you can a- |
| lso undelete files here. View PermissionsuserWhose uploads of what are being indexed on PAUSE Change Permissions- |
| userEnable other users to upload a module for any of your namespaces, manage your own permissions. Force Reindex- |
| inguserTell the indexer to index a file again (e.g. after a change in the perms table) Reset VersionuserOverrule- |
|  the record of the current version number of a module that the indexer uses and set it to 'undef' Tail Daemon Lo- |
| gfileuserN/A Edit Account InfouserEdit your user name, your email addresses (both public and secret one), change- |
|  the URL of your homepage. Change PassworduserChange your password any time you want. About Logging OutuserN/A S- |
| elect Mailinglist/ActionmlreprRepresentatives of mailing lists have their special menu here. Show Mailinglist Re- |
| psmlreprAdmins and the representatives themselves can lookup who is elected to be representative of a mailing li- |
| st. Add a User or MailinglistadminAdmins can add users or mailinglists. Look up the forward email addressadminAd- |
| mins can look where email should go Manage a registration request (alpha)adminshow/reject open registration requ- |
| ests Edit a MailinglistadminAdmins and mailing list representatives can change the name, address and description- |
|  of a mailing list. Select User/ActionadminAdmins can access PAUSE as-if they were somebody else. Here they sele- |
| ct a user/action pair. Post a messageadminPost a message to a specific user. Show/Delete MsgsadminDelete your me- |
| ssages from the message board. Index users with digrams (BROKEN)adminBatch-index all users. Show bad xhtml outpu- |
| tadminMonitor bad xhtml output stored from previous sessions coredumpadminN/A &#160; Rev: 1071.02 To validate, d- |
| ownload page first.                                                                                               |
'-------------------------------------------------------------------------------------------------------------------'
```

You can see that I ran the script with `LWPCL_REDACT_HEADERS='Authorization'`. That's a handy flag to use if you want to copy/paste an example when asking for help publicly. It replaced the **Authorization** header value with **[REDACTED]**. That's maybe not a big deal here, but there are cases where it's more important. See also `LWP_REDACT_PARAMS`.

Let's make it prettier. We'll do this by installing [HTML::FormatText::Lynx](https://metacpan.org/pod/HTML::FormatText::Lynx).

Let's run it again. I'll only show you the changed part. Instead of just displaying the text with the HTML stripped away, we get something nicer to look at.

```
.------------------------------------------------------------------------------------------------------------------------------------------------------.
| Text                                                                                                                                                 |
+------------------------------------------------------------------------------------------------------------------------------------------------------+
| [1]PAUSE Logo                                                                                                                                        |
|                                                                                                                                                      |
| The [Perl programming] Authors Upload Server                                                                                                         |
|                                                                                                                                                      |
|    OALDERS &lt;olaf@wundersolutions.com>                                                                                                                |
|    encrypted session                                                                                                                                 |
|                                                                                                                                                      |
|    Public menu                                                                                                                                       |
|    [2]Request PAUSE account                                                                                                                          |
|    [3]About PAUSE                                                                                                                                    |
|    [4]On The Naming of Modules                                                                                                                       |
|    [5]PAUSE News                                                                                                                                     |
|    [6]PAUSE History                                                                                                                                  |
|    [7]Imprint/Impressum                                                                                                                              |
|    [8]List of pumpkins                                                                                                                               |
|    User menu                                                                                                                                         |
|    Files                                                                                                                                             |
|    [9]Upload a file to CPAN                                                                                                                          |
|    [10]Show my files                                                                                                                                 |
|    [11]Repair a Pending Upload                                                                                                                       |
|    [12]Delete Files                                                                                                                                  |
|    Permissions                                                                                                                                       |
|    [13]View Permissions                                                                                                                              |
|    [14]Change Permissions                                                                                                                            |
|    Utils                                                                                                                                             |
|    [15]Force Reindexing                                                                                                                              |
|    [16]Reset Version                                                                                                                                 |
|    [17]Tail Daemon Logfile                                                                                                                           |
|    Account                                                                                                                                           |
|    [18]Edit Account Info                                                                                                                             |
|    [19]Change Password                                                                                                                               |
|    [20]About Logging Out                                                                                                                             |
|                                                                                                                                                      |
|                                                                                                                                                      |
| Hi Olaf Alders,                                                                                                                                      |
| please choose an action from the menu.                                                                                                               |
|                                                                                                                                                      |
|    The usermenu to the left shows all menus available to you, the table                                                                              |
|    below shows descriptions for all menues available to anybody on PAUSE.                                                                            |
|    Action Group Description                                                                                                                          |
|    Request PAUSE account public Apply for a PAUSE account.                                                                                           |
|    Forgot Password? public A passwordmailer that sends you a password that                                                                           |
|    enables you to set a new password.                                                                                                                |
|    About PAUSE public Same as modules/04pause.html on any CPAN server                                                                                |
|    On The Naming of Modules public A couple of suggestions that hopefully                                                                            |
|    get you on track                                                                                                                                  |
|    PAUSE News public What's going on on PAUSE                                                                                                        |
|    PAUSE History public Old News                                                                                                                     |
|    Imprint/Impressum public N/A                                                                                                                      |
|    List of pumpkins public A list, also available as YAML                                                                                            |
|    Upload a file to CPAN user This is the heart of the Upload Server, the                                                                            |
|    page most heavily used on PAUSE.                                                                                                                  |
|    Show my files user find . -ls resemblance                                                                                                         |
|    Repair a Pending Upload user When an upload you requested hangs for                                                                               |
|    some reason, you can go here and edit the file to be uploaded.                                                                                    |
|    Delete Files user Schedule files for deletion. There is a delay until                                                                             |
|    the deletion really happens. Until then you can also undelete files                                                                               |
|    here.                                                                                                                                             |
|    View Permissions user Whose uploads of what are being indexed on PAUSE                                                                            |
|    Change Permissions user Enable other users to upload a module for any                                                                             |
|    of your namespaces, manage your own permissions.                                                                                                  |
|    Force Reindexing user Tell the indexer to index a file again (e.g.                                                                                |
|    after a change in the perms table)                                                                                                                |
|    Reset Version user Overrule the record of the current version number of                                                                           |
|    a module that the indexer uses and set it to 'undef'                                                                                              |
|    Tail Daemon Logfile user N/A                                                                                                                      |
|    Edit Account Info user Edit your user name, your email addresses (both                                                                            |
|    public and secret one), change the URL of your homepage.                                                                                          |
|    Change Password user Change your password any time you want.                                                                                      |
|    About Logging Out user N/A                                                                                                                        |
|    Select Mailinglist/Action mlrepr Representatives of mailing lists have                                                                            |
|    their special menu here.                                                                                                                          |
|    Show Mailinglist Reps mlrepr Admins and the representatives themselves                                                                            |
|    can lookup who is elected to be representative of a mailing list.                                                                                 |
|    Add a User or Mailinglist admin Admins can add users or mailinglists.                                                                             |
|    Look up the forward email address admin Admins can look where email                                                                               |
|    should go                                                                                                                                         |
|    Manage a registration request (alpha) admin show/reject open                                                                                      |
|    registration requests                                                                                                                             |
|    Edit a Mailinglist admin Admins and mailing list representatives can                                                                              |
|    change the name, address and description of a mailing list.                                                                                       |
|    Select User/Action admin Admins can access PAUSE as-if they were                                                                                  |
|    somebody else. Here they select a user/action pair.                                                                                               |
|    Post a message admin Post a message to a specific user.                                                                                           |
|    Show/Delete Msgs admin Delete your messages from the message board.                                                                               |
|    Index users with digrams (BROKEN) admin Batch-index all users.                                                                                    |
|    Show bad xhtml output admin Monitor bad xhtml output stored from                                                                                  |
|    previous sessions                                                                                                                                 |
|    coredump admin N/A                                                                                                                                |
|      __________________________________________________________________                                                                              |
|                                                                                                                                                      |
|                                                                                                                                                      |
|    Rev: 1071.02                                                                                                                                      |
|                                                                                                                                                      |
|                                          To validate, download page first.                                                                           |
|                                                                                                                                                      |
|      [21]Valid CSS! [22]Valid XHTML 1.0!                                                                                                             |
|                                                                                                                                                      |
| References                                                                                                                                           |
|                                                                                                                                                      |
|    1. https://pause.perl.org/pause/authenquery                                                                                                       |
|    2. https://pause.perl.org/pause/authenquery?ACTION=request_id                                                                                     |
|    3. https://pause.perl.org/pause/authenquery?ACTION=pause_04about                                                                                  |
|    4. https://pause.perl.org/pause/authenquery?ACTION=pause_namingmodules                                                                            |
|    5. https://pause.perl.org/pause/authenquery?ACTION=pause_05news                                                                                   |
|    6. https://pause.perl.org/pause/authenquery?ACTION=pause_06history                                                                                |
|    7. https://pause.perl.org/pause/authenquery?ACTION=pause_04imprint                                                                                |
|    8. https://pause.perl.org/pause/authenquery?ACTION=who_pumpkin                                                                                    |
|    9. https://pause.perl.org/pause/authenquery?ACTION=add_uri                                                                                        |
|   10. https://pause.perl.org/pause/authenquery?ACTION=show_files                                                                                     |
|   11. https://pause.perl.org/pause/authenquery?ACTION=edit_uris                                                                                      |
|   12. https://pause.perl.org/pause/authenquery?ACTION=delete_files                                                                                   |
|   13. https://pause.perl.org/pause/authenquery?ACTION=peek_perms                                                                                     |
|   14. https://pause.perl.org/pause/authenquery?ACTION=share_perms                                                                                    |
|   15. https://pause.perl.org/pause/authenquery?ACTION=reindex                                                                                        |
|   16. https://pause.perl.org/pause/authenquery?ACTION=reset_version                                                                                  |
|   17. https://pause.perl.org/pause/authenquery?ACTION=tail_logfile                                                                                   |
|   18. https://pause.perl.org/pause/authenquery?ACTION=edit_cred                                                                                      |
|   19. https://pause.perl.org/pause/authenquery?ACTION=change_passwd                                                                                  |
|   20. https://pause.perl.org/pause/authenquery?ACTION=pause_logout                                                                                   |
|   21. http://jigsaw.w3.org/css-validator/                                                                                                            |
|   22. http://validator.w3.org/file-upload.html                                                                                                       |
'------------------------------------------------------------------------------------------------------------------------------------------------------'
```

Now, we can also turn down the verbosity of the script by passing a flag to `debug_ua()`. Any integer from 0-8 will do the trick. Let's try 6.

```perl
use strict;
use warnings;
use v5.10;
use LWP::ConsoleLogger::Easy qw( debug_ua );
use LWP::UserAgent;
use HTTP::Request::Common;

my $ua      = LWP::UserAgent->new();
debug_ua( $ua, 6 );
my $request = GET 'https://pause.perl.org/pause/authenquery';

$request->authorization_basic( 'oalders', 'seekrit' );

my $response = $ua->request($request);
```

Let's see what we get:

```
olaf$ LWPCL_REDACT_HEADERS='Authorization' perl basic-authentication.pl
GET https://pause.perl.org/pause/authenquery

.----------------+------------------.
| Request Header | Value            |
+----------------+------------------+
| Authorization  | [REDACTED]       |
| User-Agent     | libwww-perl/6.15 |
'----------------+------------------'

==> 200 OK

.-------------------------+----------------------------------------------------------------------------------------------------------------------------.
| Response Header         | Value                                                                                                                      |
+-------------------------+----------------------------------------------------------------------------------------------------------------------------+
| Cache-Control           | no-cache                                                                                                                   |
| Client-Date             | Thu, 29 Sep 2016 02:13:51 GMT                                                                                              |
| Client-Peer             | 207.171.7.119:443                                                                                                          |
| Client-Response-Num     | 1                                                                                                                          |
| Client-SSL-Cert-Issuer  | /C=US/O=GeoTrust, Inc./CN=RapidSSL CA                                                                                      |
| Client-SSL-Cert-Subject | /serialNumber=K6R2GP4nh37grllJm9PZlQm0SS-oSNZ4/C=DE/O=pause.perl.org/OU=GT38611495/OU=See www.rapidssl.com/resources/cps - |
|                         | (c)11/OU=Domain Control Validated - RapidSSL(R)/CN=pause.perl.org                                                          |
| Client-SSL-Cipher       | AES128-GCM-SHA256                                                                                                          |
| Client-SSL-Socket-Class | IO::Socket::SSL                                                                                                            |
| Connection              | close                                                                                                                      |
| Content-Length          | 11251                                                                                                                      |
| Content-Type            | text/html; charset=utf-8                                                                                                   |
| Date                    | Thu, 29 Sep 2016 02:13:51 GMT                                                                                              |
| Last-Modified           | Thu, 29 Sep 2016 02:13:51 GMT                                                                                              |
| Link                    | &lt;/pause/pause_favicon.jpg>; rel="shortcut icon"; type="image/jpeg", &lt;/pause/pause.css>; rel="stylesheet"; title="pause"; - |
|                         | type="text/css"                                                                                                            |
| Pragma                  | no-cache                                                                                                                   |
| Title                   | PAUSE: menu                                                                                                                |
| Vary                    | accept-encoding                                                                                                            |
'-------------------------+----------------------------------------------------------------------------------------------------------------------------'
```

That's far easier to read now.

This is just a very basic example of what you can do with [LWP::ConsoleLogger::Easy](https://metacpan.org/pod/LWP::ConsoleLogger::Easy). There's a lot more you can do with it and it's all laid out for you in the documentation. It really shines when you have a user agent which is going through multiple links or [if you're debugging someone else's API calls][5]. Have fun with it. It beats inserting arbitrary print statements and it could save you from pulling a lot of your own hair out someday.

 [1]: http://perlmaven.com/basic-authentication-with-lwp-useragent-and-http-request-common
 [2]: https://metacpan.org/author/SZABGAB
 [3]: https://metacpan.org/pod/LWP::UserAgent
 [4]: https://metacpan.org/pod/LWP::ConsoleLogger::Easy
 [5]: https://github.com/plu/Pithub/blob/master/examples/collaborators.pl
