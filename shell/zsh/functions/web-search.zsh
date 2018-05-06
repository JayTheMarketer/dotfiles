#!/usr/bin/env zsh
#
# web_search from terminal
#

alias google='web_search google'
alias bing='web_search bing'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias yandex='web_search yandex'
alias github='web_search github'
alias baidu='web_search baidu'
alias ecosia='web_search ecosia'
alias goodreads='web_search goodreads'
alias wiki='web_search wikipedia'
alias stack='web_search stackoverflow'
alias bootsnipp='web_search bootsnipp'
alias caniuse='web_search caniuse'
alias codepen='web_search codepen'
alias jquery='web_search jquery'
alias mdn='web_search mdn'
alias npmjs='web_search npmjs'
alias brew-search='web_search homebrew-formulae'
alias unheap='web_search unheap'
alias hn='web_search hackernews'
alias yt='web_search youtube'
alias map='web_search map'
alias amazon='web_search amazon'
alias image='web_search image'
alias huffpost='web_search huffpost'
alias reuters='web_search reuters'

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google               "https://www.google.com/search?q="
    bing                 "https://www.bing.com/search?q="
    yahoo                "https://search.yahoo.com/search?p="
    duckduckgo           "https://www.duckduckgo.com/?q="
    startpage            "https://www.startpage.com/do/search?q="
    yandex               "https://yandex.ru/yandsearch?text="
    github               "https://github.com/search?q="
    baidu                "https://www.baidu.com/s?wd="
    ecosia               "https://www.ecosia.org/search?q="
    goodreads            "https://www.goodreads.com/search?q="
    wikipedia            "https://en.wikipedia.org/?search="
    stackoverflow        "https://stackoverflow.com/search?q="
    bootsnipp            "https://bootsnipp.com/search?q="
    caniuse              "https://caniuse.com/#search="
    codepen              "https://codepen.io/search?q="
    jquery               "https://api.jquery.com/?s="
    mdn                  "https://developer.mozilla.org/search?q="
    npmjs                "https://www.npmjs.com/search?q="
    homebrew-formulae    "http://formulae.brew.sh/search/"
    unheap               "https://www.unheap.com/?s="
    hackernews           "https://hn.algolia.com/?query="
    youtube              "https://www.youtube.com/search?q="
    map                  "https://maps.google.com/maps?oi=map&q="
    amazon               "https://www.amazon.com/s/?keywords="
    image                "https://www.google.com/search?tbm=isch&q="
    huffpost             "https://www.huffingtonpost.com/search?q="
    reuters              "https://www.reuters.com/search/news?blob="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  echo "Searching $url ..."

  open "$url"
}
