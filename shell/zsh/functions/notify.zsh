## Config ZSH-Notify -- https://github.com/marzocchi/zsh-notify

# activate terminal
zstyle ':notify:*' activate-terminal yes

# On Error Settings
zstyle ':notify:*' error-icon "http://mcgurksbar.com/wp-content/uploads/2015/12/twitter-fail.jpg"
zstyle ':notify:*' error-title "Holy Fail Batman!"
zstyle ':notify:*' error-sound "Sosumi"

# On Success Settings
zstyle ':notify:*' command-complete-timeout 15
zstyle ':notify:*' success-icon "https://cdn.dribbble.com/users/99313/screenshots/2006195/ponyboy.jpg"
zstyle ':notify:*' success-title "Stay Golden Ponyboy!"
zstyle ':notify:*' success-sound "Purr"
