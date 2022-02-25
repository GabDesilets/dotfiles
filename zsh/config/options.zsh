# Do not enter command lines into the history list if they are duplicates of
# the previous event.
setopt hist_ignore_dups

# On an ambiguous completion, instead of listing possibilities or beeping,
# insert the first match immediately.
setopt menu_complete


# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file
setopt share_history


# If this is set, zsh sessions will append their history list to the history
# file, rather than overwrite it.
setopt append_history

