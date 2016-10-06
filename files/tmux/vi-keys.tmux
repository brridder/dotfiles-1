# vi-keys.tmux - vi key bindings for tmux

bind-key -t vi-copy Escape cancel
bind-key -t vi-copy v      begin-selection

bind-key -t vi-edit Escape cancel

# Cursor Movement
bind-key C-j select-pane -D
bind-key j   select-pane -D

bind-key C-k select-pane -U
bind-key k   select-pane -U

bind-key C-h select-pane -L
bind-key h   select-pane -L

bind-key C-l select-pane -R
bind-key l   select-pane -R

# Opening and Closing Windows/Panes
bind-key C-s split-window -v
bind-key s   split-window -v

bind-key C-v split-window -h
bind-key v   split-window -h

bind-key C-n new-window
bind-key n   new-window

bind-key C-q kill-pane
bind-key q   kill-pane

bind-key C-o kill-pane -a
bind-key o   kill-pane -a

# Resizing Panes
bind-key -   resize-pane -D
bind-key <   resize-pane -L
bind-key >   resize-pane -R
bind-key +   resize-pane -U
bind-key _   resize-pane -Z

# vim: ft=tmux