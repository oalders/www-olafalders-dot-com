---
title: Adding a Preview Window to Your Tab Completion
author: oalders
type: post
date: 2021-07-15T00:00:00+00:00
url: /2021/07/15/tab-completion-with-preview
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

A few days ago, I talked about [how to add tab completion to a CLI program](https://www.olafalders.com/2021/07/13/prove-tab-completion/), using [fzf](https://github.com/junegunn/fzf).

As usual, there's more than one way to do it (TIMTOWDI) and I'd like to look at another approach which also uses `fzf`.

One of the neat things about `fzf` is that it can provide you with configurable preview window. The following snippet will require `fzf` and [bat](https://github.com/sharkdp/bat/), which is another handy tool which I encourage you to explore.

The snippet we'll be using today is:

```bash
fd -e t |                          \
fzf --bind='ctrl-/:toggle-preview' \
--preview "bat --style=numbers --color=always --line-range :500 {}" \
"$@" | xargs prove
```

(If you don't want to mess around with installing and configuring things, you can just grab [my Docker image](https://github.com/oalders/fzf-demo), which is ready to go).

Before we talk about what's going on, you can preview the snippet by clicking on the screencast below:

[![asciicast](https://asciinema.org/a/y4aVnAgjtdZQBnPJzG6fpfEzz.png)](https://asciinema.org/a/y4aVnAgjtdZQBnPJzG6fpfEzz)

Like the example in the previous blog post, we're using `fd` to find files ending in `.t`. We then pipe that list to `fzf`, using the `--preview` arg. In the preview, we specify that we'd like to enable line numbers and colors and that we'd like to preview via `bat`. `line-range` unsurprisingly sets how many lines of context should be displayed in the preview pane. We're using 500 here, but that could easily 30 or some other number of your choosing.

You'll also want to note that `--bind='ctrl-/:toggle-preview'` allows us to turn the preview window on and off using `<ctrl>-`. (Feel free to use a key combination which you like better.)

Towards the end of the screencast you'll see that I toggle the preview window on and off.

You can bust out this snippet when you want to be fancy or you can add a shell function which takes care of that for you. Have fun with it!
