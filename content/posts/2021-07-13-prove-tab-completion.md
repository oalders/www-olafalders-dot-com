---
title: Adding Tab Completion to Your Favourite CLI Programs
author: oalders
type: post
date: 2021-07-13T00:00:00+00:00
url: /2021/07/13/prove-tab-completion
categories:
  - Perl
  - Programming
  - Testing
  - Tab completion
  - fzf
  - prove
  - fd

---

I like to find what I need quickly, so I make heavy use of tab completion at the command line. Lately, I've been using [fzf](https://github.com/junegunn/fzf) more and more to do this. It's a wonderful tool. I won't go in depth about `fzf` here, but if you haven't checked it out, please do. I think it's well worth it.

What I want to do today is to explain how to harness the power of `fzf` to add tab completion to an arbitrary command line program. In this case, it's Perl's `prove`, which many of us use when running tests.

Often when running tests, I want the results I'm looking for as fast as possible. So, I'll want to run one or more files, but not everything in the test suite. Running every test can be slow. Anything that allows my mind to wander is something I want to avoid.

What I want to be able to do is run `prove **<tab>` and get a multi-select list. Bonus points if that list can be searched and narrowed down further once it appears. 

Enter `fzf`.

## The bash (and zsh) implementation

I'm going to assume that you already have `fzf` installed and that you're using the `bash` or `zsh` shell. In this case, all you need to do is add the following lines to your `.bashrc` and then `source ~/.bashrc` and you're ready to go.

```bash
_fzf_complete_prove() {
  _fzf_complete --reverse --multi --prompt="prove> " -- "$@" < <(
      find t | grep .t$
  )
}

_fzf_complete_prove_post() {
    awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_prove -o default -o bashdefault prove
```

Note that if you're using `zsh` you won't need the last line.

## Using fd rather than find

You'll note that my solution above uses `find`, but nowadays I actually prefer [fd](https://github.com/sharkdp/fd). If you also enjoy using `fd`, you can do something like:

```
_fzf_complete_prove() {
  _fzf_complete --reverse --multi --prompt="prove> " -- "$@" < <(
      fd -e t
  )
}
```

This recursively finds files with the `.t` extension. Note that since we haven't specified a folder here, this will search in `t` and `xt`, so it will find more test files than the `find` command above. Use your favourite tool here and be creative.

## Using Your Fancy New CLI

Now, you can do things like:

```bash
prove -lv **<tab>
```

or just

```bash
prove **<tab>
```

and you'll be presented with a list of tests to run.

```bash
$ prove -lv **
prove>
  63/63 (0)
>> t/00-load.t
   t/add_header.t
   t/aliases.t
   t/area_link.t
   t/autocheck.t
   t/bad-request.t
   t/clone.t
   t/content.t
   t/cookies.t
   t/credentials-api.t
   t/credentials.t
   t/die.t
   t/dump.t
   t/field.t
   t/find_frame.t
```

You can now start typing to narrow down the list further. You can use your tab key to select multiple files.

```bash
$ prove -lv **
prove>
  63/63 (3)
  >t/00-load.t
   t/add_header.t
   t/aliases.t
  >t/area_link.t
   t/autocheck.t
>>>t/bad-request.t
   t/clone.t
   t/content.t
   t/cookies.t
   t/credentials-api.t
   t/credentials.t
   t/die.t
   t/dump.t
   t/field.t
   t/find_frame.t
```

Once you're done, just `<enter>` and you'll have a command line that is ready to run your tests:

```bash
prove -lv t/00-load.t t/area_link.t t/bad-request.t
```

That's it! 