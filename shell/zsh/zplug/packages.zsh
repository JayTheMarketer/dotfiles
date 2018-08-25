# ============================================================================ #
#                                     ZPLUG                                    #
# ============================================================================ #

# Let ZPLUG manage ZPLUG
zplug "zplug/zplug", hook-build:"zplug --self-manage"


# ============================================================================ #
#                                     THEMES                                   #
# ============================================================================ #

# Spaceship - https://github.com/denysdovhan/spaceship-prompt
#
zplug "denysdovhan/spaceship-prompt", \
  use:spaceship.zsh, \
  from:github, \
  as:theme

# ============================================================================ #
#                                    GITHUB                                    #
# ============================================================================ #

# advanced zsh navigation tools, type ^R (ctrl-r)
# https://git.io/vNDeN
#
zplug "psprint/zsh-navigation-tools"

# to insert emoji to the command line, type ^S (ctrl-s)
# https://git.io/vbDPJ
#
zplug "b4b4r07/emoji-cli"

# wakatime terminal tracking
# https://git.io/vb1vU
#
zplug "wbingli/zsh-wakatime"

# a shell where red ERROR just works
# https://git.io/vbDPw
#
zplug "Tarrasch/zsh-colors"

# plugin that auto-closes, deletes and skips over matching delimiters in zsh intelligently
# https://git.io/vbDPy
#
zplug "hlissner/zsh-autopair"

# reminds you of your aliases
# https://git.io/vbDXZ
#
zplug "molovo/tipz"

# add custom terminal notifiers
# https://git.io/vbDSc
#
zplug "marzocchi/zsh-notify"

# alternative to ls that includes git statuses
# https://git.io/va9l1
#
zplug "supercrabtree/k"

# additions to ZSH completions
# https://git.io/vbD50
#
zplug "zsh-users/zsh-completions", \
  defer:1

# tracks your most used directories, based on 'frecency'
# https://git.io/vbNud
#
zplug "knu/z", \
  use:"z.sh", \
  defer:2

# fish shell-like syntax highlighting for zsh
# optimized version of zsh-users/zsh-syntax-highlighting
# https://git.io/vbHlg
#
zplug "zdharma/fast-syntax-highlighting", \
  defer:2

# zsh implementation of the Fish shell's history search feature
# https://git.io/vbDxJ
#
zplug "zsh-users/zsh-history-substring-search", \
  defer:3

# make the shell more Bash compatible (including completions with bashcompinit)
# https://git.io/vbDQt
#
zplug "chrissicool/zsh-bash", \
  defer:3

# fish-like fast/unobtrusive autosuggestions for zsh.
# https://git.io/vbNux
#
zplug "zsh-users/zsh-autosuggestions", \
  defer:3
