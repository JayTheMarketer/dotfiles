function brewgraph --description 'graph homebrew dependencies (depends on martido/brew-graph and graphviz)'
	brew graph --installed --highlight-leaves | fdp -Tpng -o "$HOME/Downloads/graph.png"
end
