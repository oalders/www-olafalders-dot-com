---
title: vim, Ale, Syntastic and Perl::Critic
author: oalders
type: post
date: 2017-10-17T17:32:19+00:00
url: /2017-10-17-vim-ale-syntastic-and-perlcritic
categories:
  - Perl
  - Programming

---
As a vim user, I've used [Syntastic][1] for a long time. It's a great tool for syntax checking. However, I was recently introduced to [Ale][2]. Ale does a lot of what Syntastic does, but it does it asynchronously. The practical benefits are

  * You should experience less lag when editing large files
  * Ale flags problematic lines containing errors and warnings in a gutter, making it easy to find problems
  * Detailed information about errors and warnings appear at the bottom of your buffer

I may actually be underselling it. Ale is almost a drop-in replacement for Syntastic. (At least it was for me). Try it out. I don't think you'll go back to Syntastic once you've tried Ale.

## Ale Configuration

`let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'`

This is what I'm currently using. (Note the Ale defaults to `-c -Mwarnings -Ilib`). Often I'm working with a **t/lib** directory. Having this included by default means less chance of my code not compiling when it's run by Ale. Of course, pass in any flags which you may require here. You'll likely want to keep the **-c** since you want to compile the code rather than run it. Keep in mind that code in `BEGIN` blocks will still be executed under the `-c` flag, so there can be security implications to opening random Perl files with this setting. Explicitly enabling the **warnings** pragma at the command line will cover you for cases where you haven't already enabled warnings in your code. Your needs may vary depending upon your environment, so keep in mind that your vimrc can source other files. You can add something like the following to your vimrc:

`source ~/.local_vimrc`

## Perl::Critic Configuration

`<br />
let g:ale_perl_perlcritic_showrules = 1<br />
` 

When this is enabled, you'll be shown which Perl::Critic rules which have been violated by your code. This helps you to a) fix the issue or b) copy/paste the rule class name so that you can whitelist the code in question.  For example, you may be told that you're violating [Perl::Critic::Policy::Modules::ProhibitEvilModules][3].  If you feel you need to embrace the evil, this makes it easy to add a `## no critic (ProhibitEvilModules)` to the code in question.   Trust me, this is much easier than digging around to figure out exactly which policy you've violated.

Lastly, the default behaviour of Ale's Perl::Critic linting is to display all violations as errors. I find this confusing, because if something is not preventing my code from compiling, I do not consider this to be an error. In order to set Perl::Critic violations to be displayed as warnings, just add the following to your **.vimrc**:

let g:ale\_type\_map = {  
\ &#8216;perlcritic': {&#8216;ES': &#8216;WS', &#8216;E': &#8216;W'},  
\}

The above is a map, so you can add config options for other Ale linters to this map as well.

Unfortunately, the current incarnation of Ale can't tell the difference between a Perl error and a warning. [I have started a pull request][4] to try to improve this somewhat, but I got stuck on the Docker end of things and haven't gotten back to it yet. If you'd like to pitch in, I wouldn't mind the help. 🙂

 [1]: https://github.com/vim-syntastic/syntastic
 [2]: https://github.com/w0rp/ale
 [3]: https://metacpan.org/pod/Perl::Critic::Policy::Modules::ProhibitEvilModules
 [4]: https://github.com/w0rp/ale/pull/933
