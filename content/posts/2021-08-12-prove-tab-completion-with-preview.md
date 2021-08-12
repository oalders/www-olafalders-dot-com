---
title: Improving prove with Preview Windows
author: oalders
type: post
date: 2021-08-12T00:00:00+00:00
url: /2021/08/12/prove-tab-completion-with-preview
categories:
  - Perl
  - Programming
  - Testing
  - Tab completion
  - fzf
  - prove
  - fd
  - bat

---

Last month, I talked about [how to add tab completion to a CLI program](https://www.olafalders.com/2021/07/13/prove-tab-completion/), using [fzf](https://github.com/junegunn/fzf). Next we talked about [a more generic solution](/2021/07/15/tab-completion-with-preview/) which adds a preview window to a file search.

Today we will look at how to combine the knowledge from these two posts. What we want to do is have our custom completion for the `prove` CLI, but with a preview window. The solution looks like this:

```bash
_fzf_complete_prove() {
  _fzf_complete  --bind='ctrl-/:toggle-preview' --preview 'bat --style=numbers --color=always --line-range :50 {}' --reverse --multi --prompt="prove> " -- "$@" < <(
      fd -e t
  )
}

_fzf_complete_prove_post() {
    awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_prove -o default -o bashdefault prove
```

If you don't have `bat` installed, you can use `cat` for your file previews instead. You'll just need a different incantation in `_fzf_complete_prove()`:

```bash
_fzf_complete_prove() {
  _fzf_complete  --bind='ctrl-/:toggle-preview' --preview 'cat {}' --reverse --multi --prompt="prove> " -- "$@" < <(
      fd -e t
  )
}
```

If you don't have `fd` installed, swap it out with `find` or whatever your preferred tool is. Maybe something like `find t | grep "\.t$"`. If you're an `ack` user, you could try something like `ack -f t | grep "\.t$"`.

For reference, [this is where my fzf completions currently live in my dot-files](https://github.com/oalders/dot-files/blob/main/fzf_functions.sh).

That's it! Now, you'll get the same behaviour as we saw in our previous screencast, but you can now get it via `prove **<tab>`.

See the previous screencast for reference:

[![asciicast](https://asciinema.org/a/y4aVnAgjtdZQBnPJzG6fpfEzz.png)](https://asciinema.org/a/y4aVnAgjtdZQBnPJzG6fpfEzz)