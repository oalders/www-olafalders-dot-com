---

title: Opening Files Quickly from Inside vim
author: oalders
type: post
date: 2022-01-05T00:00:00+00:00
url: /2022/01/05/open-this-file-from-inside-vim
categories:
  - vim
  - Perl
  - Programming
  - Open::This
  - CPAN
summary: "I use [ot](https://metacpan.org/pod/ot) a lot when it comes to opening files. I wanted to be able to use this tool from inside vim as well. It turns out, the solution is quite simple."

---

## Preamble

If you'd like to try this out, make sure you have [Open::This](https://metacpan.org/pod/Open::This) installed. You can install it via [cpanm](https://metacpan.org/pod/cpanm):


```
cpanm Open::This
```

## The Problem

A couple of years ago [I wrote an article](https://www.perl.com/article/how-do-i-open-this-/) on how to use [Open::This](https://metacpan.org/pod/Open::This) to get to files (and locations within files) more easily. I use this tool from the command line constantly, but I've always had to exit `vim` in order to use [ot](https://metacpan.org/pod/ot).

## The Solution

I got most of the way there by reading docs, but asking a question on [vi.stackexchange.com](https://vi.stackexchange.com/questions/34818/how-to-use-histadd-with-a-custom-function/34819#34819) got me to the finish line.


```vim
nnoremap <leader>ot :call OT(input("ot: ", "", "file"))<cr>

function! OT(fname)
    let res = system("ot --editor vim --print " . shellescape(a:fname))
    if v:shell_error
        echo "\n" . res
    else
        execute "e " res
    endif
    call histadd(':', printf('call OT("%s")', escape(a:fname, '"\')))
endfunction
```

After adding the above to my [.vimrc](https://github.com/oalders/dot-files/blob/main/vim/vimrc) I can open files even faster than before. Now from inside `vim` I can enter `,ot` and can then happily pass arguments to [ot](https://metacpan.org/pod/ot) from `vim`. This solution even populates `vim`'s history so that I can easily re-run an earlier command. You can see it in action below:

## Demo

[![asciicast](https://asciinema.org/a/xx5rY3Nlhfi8B8wGIC9JSCNMp.png)](https://asciinema.org/a/xx5rY3Nlhfi8B8wGIC9JSCNMp)
