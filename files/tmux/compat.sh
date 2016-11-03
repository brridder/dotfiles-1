#!/bin/sh -x
# compat.sh - tmux compatibility

# tmux does a terrible job integrating with the underlying operating
# system, especially when it is executing in a graphical environment. To
# add insult to injury, backward compatibility is not maintained for
# options, which change meaning between versions. This script attempts
# to bridge the divide so a common tmux.conf can be used on different
# systems running different versions without issue.

case `uname -s` in
Darwin)
	tmux set-option -g default-command "reattach-to-user-namespace -l $SHELL"
	tmux bind-key -t vi-copy Enter copy-pipe pbcopy
	tmux bind-key -t vi-copy y     copy-pipe pbcopy
	tmux bind-key ] run-shell "pbpaste | tmux load-buffer - && tmux paste-buffer"
	;;
Linux)
	tmux bind-key -t vi-copy Enter copy-pipe "xclip -i -selection clipboard"
	tmux bind-key -t vi-copy y     copy-pipe "xclip -i -selection clipboard"
	tmux bind-key ] run-shell "xclip -o | tmux load-buffer - && tmux paste-buffer"
	;;
esac

version=`tmux -V | cut -c 6-`
has_version() {
	return `echo $@ | awk "{print !($version >= \$1)}"`
}

if has_version 2.1; then
	tmux set-option -g mouse on
elif has_version 1.6; then
	tmux set-option -g mouse-mode on
	tmux set-option -g mouse-resize-pane on
	tmux set-option -g mouse-select-pane on
	tmux set-option -g mouse-select-window on
fi
exit 0
