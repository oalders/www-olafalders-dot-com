---
title: Adding History to fpp (Facebook PathPicker)
author: oalders
type: post
date: 2016-01-14T03:53:57+00:00
url: /2016/01/14/adding-history-to-fpp-facebook-pathpicker
dsq_thread_id:
  - 4674490358
categories:
  - Programming

---
I've been a fan of \`fpp\` [(Facebook PathPicker](https://github.com/facebook/PathPicker)) since I first heard about it. I had long been looking for something like this and had even considered writing it myself. Fortunately someone else spared me the work and did a much better job than I would have.

It's no exaggeration to say that I use this utility every day at $work. In fact I use it many times per hour. It's part of my normal workflow now. For example, I like to pipe the output of \`git status\` to \`fpp\` and then pick and choose some unit tests I've edited and then run them. I may need to do this many times over the course of a day. The problem is that \`fpp\` doesn't have a proper built in history. Having to go through this process of picking through the output of a \`git status\` many times per day is a bit of a time sink. It's still maybe faster than what I would have done before, but it feels like jumping through hoops. I want to be able to replay any command I've just run. It should be easy, right?

As it happens, there's already a file which \`fpp\` creates after each run. It's found in \`~/.fpp/.fpp.sh\` and it's executable. So, my first attempt at solving this problem was to add a shell alias: \`alias redo='sh ~/.fpp/.fpp.sh'\`. This lets me re-run the \_very last\_ command which I've just run via \`fpp\`. I now have instant replay.

However, if I've used \`fpp\` for something else in the meantime, the results of that command replace whatever was in \`~/.fpp/.fpp.sh\`. I can't magically get back to the penultimate command which I ran, since it's now lost forever. After playing with this for a few hours, I realized that I really do need to be able to replay my entire history, since I want to be able to pick an arbitrary command and re-run it. Having to remember exactly what I did last before running \`redo\` was getting to be frustrating.

As part of the process, I found an open Github issue for \`fpp\` history. After I commented it on it, [@pcottle made the following very helpful suggestion](https://github.com/facebook/PathPicker/issues/171#issuecomment-160722643), which was to alias \`fpp\` and wrap it with my own history logic. That seemed like a good idea. So let's look at what we have to work with.

On my machines, \`~/.fpp/.fpp.sh\` generally looks something like this, where the \_second last\_ line in the file contains the line which I want to re-execute. (There's a blank line which starts the file, but my syntax highlighter seems to be stripping it away here).

```
vim -O './README.md'
exit;
```

I figured I could pretty easily grab this line from \`~/.fpp/.fpp.sh\` and log it to my own history file. I'd then add a little functionality to make it all easier to work with. I had thought about doing this in Perl, but just keeping everything in my \`.bashrc\` file felt like it was going to be the most portable solution. I didn't want to have to do anything more complicated than updating and sourcing my dot files in order to get this to work.

The code which I came up with does the following:

  * Appends the second last line of \`~/.fpp/.fpp.sh\` to my own history file every time \`fpp\` is run
  * Adds a \`&#8211;redo\` flag, which execs the last line of the history file, when there are no accompanying arguments
  * Adds a \`&#8211;history\` flag which will print the contents of this history file to the screen, with accompanying line numbers
  * Execs an arbitrary line from the history file if \`&#8211;redo\` is supplied with a positive integer. (The integers correspond to the line numbers provided by \`fpp &#8211;history\`). So, \`fpp &#8211;redo 10\` execs line 10 from \`fpp &#8211;history\`. It's a bit like \`!10\` to get to command 10 after running \`history\` in your shell.
  * Execs an abitrary line from the history file (moving backwards) if \`&#8211;redo\` is supplied with a negative integer. ie \`fpp &#8211;redo -1\` execs the last line in the file. \`fpp &#8211;redo -2\` execs the second last line etc

I'm not by any stretch an expert in shell scripting, so I did a lot of searching on StackOverflow, copy/pasting and bugging my colleagues at $work. Eventually and quite happily I've come up with an incantation which suits my needs.

This is what I added to my \`[.bashrc](https://github.com/oalders/dot-files/blob/master/bashrc)\`. Usage is contained inline, in the comments.

```bash
function fpp() {
    local fpp=$(type -fp fpp)

    HISTORY_FILE="$HOME/.fpp/.fpp_history"
    FPP_CACHE="$HOME/.fpp/.fpp.sh"

    touch $HISTORY_FILE

    # fpp --history just displays entire history prefixed by line numbers
    # fpp --redo will re-exec the last entry in the history file
    # fpp --redo -1 will also re-exec the last entry in the history file
    # fpp --redo -2 will re-exec the second last line in the history file
    # fpp --redo 11 will re-exec entry number 11 in the history file
    case "$1" in
        --history)
        cat -n $HISTORY_FILE
        return 1
        ;;
        --redo)
        if [ $2 ] ; then
            if [ $2 \> 0 ] ; then
                LAST_HISTORY_LINE=$(head -n $2 $HISTORY_FILE |tail -n 1)
            else
                LINE_NUMBER=$(( $2 * -1))
                LAST_HISTORY_LINE=$(tail -n $LINE_NUMBER $HISTORY_FILE | head -n 1)
            fi
        else
            LAST_HISTORY_LINE=$(tail -n 1 $HISTORY_FILE )
        fi

        eval $LAST_HISTORY_LINE
        return 1
        ;;
    esac

    LAST_HISTORY_LINE=$(tail -n 1 $HISTORY_FILE)
    $fpp "$@"
    LAST_COMMAND=$(tail -n 2 $FPP_CACHE | head -n 1)

    # Don't keep adding the same command to the history file.
    # Also, don't log a message about a no-op.

    if [[ ("$LAST_COMMAND" != 'echo "nothing to do!" && exit 1') && ("$LAST_COMMAND" != "$LAST_HISTORY_LINE") ]] ; then
        echo $LAST_COMMAND >> $HISTORY_FILE
    fi
}
```

This will get out of date over time, so the canonical version should always be found in my [dot-files](https://github.com/oalders/dot-files) repo.

If you'd like to see something like this built into \`fpp\` itself, it wouldn't hurt to bump the issue I mentioned above. I hope someone finds this helpful.
