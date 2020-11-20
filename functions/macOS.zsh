# Open commands
alias o='open'
alias ofd='open $PWD'
alias app='open -a'
alias fdr='open -a Finder'

function _omz_osx_get_frontmost_app() {
  local the_app=$(
    osascript 2>/dev/null <<EOF
      tell application "System Events"
        name of first item of (every process whose frontmost is true)
      end tell
EOF
  )
  echo "$the_app"
}

function tab() {
  # Must not have trailing semicolon, for iTerm compatibility
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_omz_osx_get_frontmost_app)

  if [[ "$the_app" == 'Terminal' ]]; then
    # Discarding stdout to quash "tab N of window id XXX" output
    osascript >/dev/null <<EOF
      tell application "System Events"
        tell process "Terminal" to keystroke "t" using command down
      end tell
      tell application "Terminal" to do script "${command}" in front window
EOF

  elif [[ "$the_app" == 'iTerm' ]]; then
    osascript <<EOF
      tell application "iTerm"
        set current_terminal to current terminal
        tell current_terminal
          launch session "Default Session"
          set current_session to current session
          tell current_session
            write text "${command}"
          end tell
        end tell
      end tell
EOF

  elif [[ "$the_app" == 'iTerm2' ]]; then
      osascript <<EOF
        tell application "iTerm2"
          tell current window
            create tab with default profile
            tell current session to write text "${command}"
          end tell
        end tell
EOF

  else
    echo "tab: unsupported terminal app: $the_app"
    false

  fi
}

function vsplit_tab() {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_omz_osx_get_frontmost_app)

  if [[ "$the_app" == 'iTerm' ]]; then
    osascript <<EOF
      -- tell application "iTerm" to activate

      tell application "System Events"
        tell process "iTerm"
          tell menu item "Split Vertically With Current Profile" of menu "Shell" of menu bar item "Shell" of menu bar 1
            click
          end tell
        end tell
        keystroke "${command} \n"
      end tell
EOF

  elif [[ "$the_app" == 'iTerm2' ]]; then
      osascript <<EOF
        tell application "iTerm2"
          tell current session of first window
            set newSession to (split vertically with same profile)
            tell newSession
              write text "${command}"
              select
            end tell
          end tell
        end tell
EOF

  else
    echo "$0: unsupported terminal app: $the_app" >&2
    false

  fi
}

function split_tab() {
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  local the_app=$(_omz_osx_get_frontmost_app)

  if [[ "$the_app" == 'iTerm' ]]; then
    osascript 2>/dev/null <<EOF
      tell application "iTerm" to activate

      tell application "System Events"
        tell process "iTerm"
          tell menu item "Split Horizontally With Current Profile" of menu "Shell" of menu bar item "Shell" of menu bar 1
            click
          end tell
        end tell
        keystroke "${command} \n"
      end tell
EOF

  elif [[ "$the_app" == 'iTerm2' ]]; then
      osascript <<EOF
        tell application "iTerm2"
          tell current session of first window
            set newSession to (split horizontally with same profile)
            tell newSession
              write text "${command}"
              select
            end tell
          end tell
        end tell
EOF

  else
    echo "$0: unsupported terminal app: $the_app" >&2
    false

  fi
}

function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

function cdf() {
  cd "$(pfd)"
}

function pushdf() {
  pushd "$(pfd)"
}

function ql() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

function manp() {
  man -t "$@" | open -f -a Preview
}

function vncviewer() {
  open vnc://$@
}

# iTunes control function
function itunes() {
	local opt=$1
	local playlist=$2
	shift
	case "$opt" in
		launch|play|pause|stop|rewind|resume|quit)
			;;
		mute)
			opt="set mute to true"
			;;
		unmute)
			opt="set mute to false"
			;;
		next|previous)
			opt="$opt track"
			;;
		vol)
			opt="set sound volume to $1" #$1 Due to the shift
			;;
		playlist)
		# Inspired by: https://gist.github.com/nakajijapan/ac8b45371064ae98ea7f
if [[ ! -z "$playlist" ]]; then
                    		osascript -e 'tell application "iTunes"' -e "set new_playlist to \"$playlist\" as string" -e "play playlist new_playlist" -e "end tell" 2>/dev/null;
				if [[ $? -eq 0 ]]; then
					opt="play"
				else
					opt="stop"
				fi
                  else
                    opt="set allPlaylists to (get name of every playlist)"
                  fi
                ;;
		playing|status)
			local state=`osascript -e 'tell application "iTunes" to player state as string'`
			if [[ "$state" = "playing" ]]; then
				currenttrack=`osascript -e 'tell application "iTunes" to name of current track as string'`
				currentartist=`osascript -e 'tell application "iTunes" to artist of current track as string'`
				echo -E "Listening to $fg[yellow]$currenttrack$reset_color by $fg[yellow]$currentartist$reset_color";
			else
				echo "iTunes is" $state;
			fi
			return 0
			;;
		shuf|shuff|shuffle)
			# The shuffle property of current playlist can't be changed in iTunes 12,
			# so this workaround uses AppleScript to simulate user input instead.
			# Defaults to toggling when no options are given.
			# The toggle option depends on the shuffle button being visible in the Now playing area.
			# On and off use the menu bar items.
			local state=$1

			if [[ -n "$state" && ! "$state" =~ "^(on|off|toggle)$" ]]
			then
				print "Usage: itunes shuffle [on|off|toggle]. Invalid option."
				return 1
			fi

			case "$state" in
				on|off)
					# Inspired by: http://stackoverflow.com/a/14675583
					osascript 1>/dev/null 2>&1 <<-EOF
					tell application "System Events" to perform action "AXPress" of (menu item "${state}" of menu "Shuffle" of menu item "Shuffle" of menu "Controls" of menu bar item "Controls" of menu bar 1 of application process "iTunes" )
EOF
					return 0
					;;
				toggle|*)
					osascript 1>/dev/null 2>&1 <<-EOF
					tell application "System Events" to perform action "AXPress" of (button 2 of process "iTunes"'s window "iTunes"'s scroll area 1)
EOF
					return 0
					;;
			esac
			;;
		""|-h|--help)
			echo "Usage: itunes <option>"
			echo "option:"
			echo "\tlaunch|play|pause|stop|rewind|resume|quit"
			echo "\tmute|unmute\tcontrol volume set"
			echo "\tnext|previous\tplay next or previous track"
			echo "\tshuf|shuffle [on|off|toggle]\tSet shuffled playback. Default: toggle. Note: toggle doesn't support the MiniPlayer."
			echo "\tvol\tSet the volume, takes an argument from 0 to 100"
			echo "\tplaying|status\tShow what song is currently playing in iTunes."
			echo "\tplaylist [playlist name]\t Play specific playlist"
			echo "\thelp\tshow this message and exit"
			return 0
			;;
		*)
			print "Unknown option: $opt"
			return 1
			;;
	esac
	osascript -e "tell application \"iTunes\" to $opt"
}

### Screenshots
CAPTURE_FOLDER="$HOME/Desktop"
alias capcp="screencapture -c" # to clipboard
alias capselcp="screencapture -i -c" # selection to clipboard
alias capwincp="screencapture -i -w -c" # window capture to clipboard
function cap() { # to file
    screencapture "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}
function capsel() { # selection to file
    screencapture -i "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}
function capwin() { # window to file
    screencapture -i -w "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

### Get OS X Software Updates, and update installed Homebrew, NPM, and their globally installed packages
alias updateall='sudo softwareupdate --install --all; brewup; npmup;'

alias eject="diskutil eject"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias top='TERM=vt100 top'
alias reveal='open --reveal'

# send notification to notification center (brew install terminal-notifier)
alias notify="terminal-notifier"

command -v hd > /dev/null || alias hd="hexdump -C" # Canonical hex dump; some systems have this symlinked
command -v md5sum > /dev/null || alias md5sum="md5" # OS X has no `md5sum`, so use `md5` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum" # OS X has no `sha1sum`, so use `shasum` as a fallback

alias firewall="sudo /usr/libexec/ApplicationFirewall/socketfilterfw"

## Create locate database
alias locatedb="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist"

# Empty the Trash on all mounted volumes and the main HDD -- also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; ~/Library/Mobile Documents/com~apple~CloudDocs/.Trash"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Recursively delete `.DS_Store` files
alias dscleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Remove broken symlinks
alias symcleanup="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

# Disk Utilities
alias dud='du -d 1 -h' # disk utility usage statistics, depth 1, human readable output
alias duf='du -sh *' # # disk utility, specified file, human readable output
alias diskspace_report="df -P -kHl"
alias free="ruby ${DOTFILES}/shell/zsh/functions/free-memory.rb" # macOS alternative to linux `free` command

### Networking. IP address, Dig, DNS, URLs
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
alias localip="ipconfig getifaddr en0"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}'"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias whois="whois -h whois-servers.net" # Enhanced WHOIS lookups
alias rot13='tr a-zA-Z n-za-mN-ZA-M' # ROT13-encode text. Works for decoding, too!

# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

### Stuff I never really use but cannot delete either because of http://xkcd.com/530/

alias weather="curl -s wttr.in/$1"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias quiet="osascript -e 'set volume 2'"
alias hax="terminal-notifier -sender ID 'com.apple.ActivityMonitor' -title 'System error' -message 'WTF R U DOIN' -sound 'Beep'"
