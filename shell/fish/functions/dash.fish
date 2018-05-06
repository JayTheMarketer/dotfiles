function dash --description 'Opens dash docs for the given query' --argument-names flag
  switch "$flag"
    case -h --help
      printf "Usage: dash QUERY\n\n"
      printf "    -h --help        Show usage and examples\n\n"
      printf "Examples:\n\n"
      printf "    dash\n"
      printf "    dash fish\n"
      printf "    dash rails:activerecord\n"
      printf "    dash ruby: hash dig\n"
      return
  end

  if test (count $argv) -gt 1
    open "dash://$argv[1]:$argv[2]"
  else
    open "dash://$argv"
  end
end
