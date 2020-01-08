# Defined in /var/folders/2m/xvrkknqj1kd8g9t3m6fm0sr40000gq/T//fish.mE0FRl/brewgraph.fish @ line 2
function brewgraph --description 'graph homebrew dependencies (depends on martido/brew-graph and graphviz)'
	brew graph --installed --highlight-leaves | fdp -Tpng -o "$HOME/Downloads/homebrew-graph.png";
	open "$HOME/Downloads/homebrew-graph.png"
end
