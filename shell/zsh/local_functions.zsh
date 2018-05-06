#!/usr/bin/env zsh

# load local functions
typeset -U function_folder
function_folder="${DOTFILES}/shell/zsh/functions"

if [ -d $function_folder ]; then

  # load everthing
  for file in ${function_folder}/*.zsh; do
    source $file
  done

  # add local function folder to fpath so that they can add functions and completion scripts
  fpath=( $function_folder "${fpath[@]}" )

fi

# keep it clean
unset function_folder
