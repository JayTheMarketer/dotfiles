# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.4fis4R/brewgraph.fish @ line 2
function brewgraph --description 'graph homebrew dependencies (depends on martido/brew-graph and graphviz)'
	brew graph --installed --highlight-leaves | fdp -Tpng -o "$HOME/Downloads/graph.png";
	open "$HOME/Downloads/graph.png"
end
