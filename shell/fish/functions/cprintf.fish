# Defined in /var/folders/jr/5blkp97x441_cj_thkkc6v2m0000gn/T//fish.ZevlwZ/cprintf.fish @ line 1
function cprintf --description 'Printf with colors (usage: cprintf "<bg:red>background red</bg> or <fg:blue>text blue</fg>"' --argument text
	set -l text (echo $text | awk -F "[<|>]" '{ for(i=1;i<=NF;i++){print $i} }')
  set -e argv[1]
  set -l pieces (
    set -l color
    for a in $text
      switch $a
        case b
          set_color -o
        case u
          set_color -u
        case bl
          printf "\e[5m"
        case fg:\*
          set color (echo $a | cut -d: -f 2)
          set_color $color
        case bg:\*
          set color (echo $a | cut -d: -f 2)
          set_color -b $color
        case /b
          printf "\e[22m"
        case /u
          printf "\e[24m"
        case /bl
          printf "\e[25m"
        case /fg
          printf "\e[39m"
        case /bg
          printf "\e[49m"
        case \*
          echo -n $a
      end
    end
  )
  printf "$pieces"\n $argv
end
