export BREWSBIN="$(brew --prefix)/sbin"
export BREWBIN="$(brew --prefix)/bin"
echo $PATH | grep -q $BREWSBIN || export PATH=$BREWSBIN:$PATH
echo $PATH | grep -q $BREWBIN || export PATH=$BREWBIN:$PATH
