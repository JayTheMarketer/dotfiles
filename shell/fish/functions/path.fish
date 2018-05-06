function path --description 'adds, removes, and displays $PATH'
  if test (count $argv) -gt 0
    switch $argv[1]
      case Add ADD add
        set --universal fish_user_paths $fish_user_paths $argv[2..-1]
      case Remove REMOVE remove
        for path in $argv
          if set --local index (contains --index $path $fish_user_paths)
              set --erase --universal fish_user_paths[$index]
          end
        end
      case User USER user
        echo $fish_user_paths
      case '*'
        printf '\n'
        printf 'Usage:\n'
        printf '  - path add\n'
        printf '      * eg. `path add /usr/local/bin` to append path to $fish_user_paths\n'
        printf '  - path remove\n'
        printf '      * eg. `path remove /usr/local/bin` to remove path from $fish_user_paths\n'
        printf '  - path user\n'
        printf '      * eg. `path user` will display pretty-printed $fish_user_paths\n'
        printf '  - path\n'
        printf '      * will display pretty-printed $PATH\n'
        printf '\n'
    end
  else
    printf "%s\n" $PATH | column
  end
end
