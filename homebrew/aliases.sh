#!/usr/bin/env bash

if command -v brew >/dev/null; then

	# Brew aliases
	alias brewc='brew cleanup'
	alias brewC='brew cleanup --force'
	alias brewi='brew install'
	alias brewin='brew info'
	alias brewl='brew list'
	alias brewo='brew outdated'
	alias brews='brew search'
	alias brewu='brew update && brew upgrade'
	alias brewx='brew remove'

	# Homebrew Cask
	alias cask='brew cask'
	alias caski='brew cask install'
	alias caskin='brew cask info'
	alias caskl='brew cask list'
	alias casko='brew cask outdated'
	alias casks='brew cask search'
	alias caskx='brew cask uninstall'

	# More thorough alternative to `brew reinstall`
	rebrew() {
		if [ -z "$1" ]; then
			echo 'No package specified'
		else
			brew uninstall "$1" && brew install "$1"
		fi
	}

	# More thorough alternative to `brew reinstall`
	recask() {
		if [ -z "$1" ]; then
			echo 'No package specified'
		else
			brew cask uninstall "$1" && brew cask install "$1"
		fi
	}

	# List all running services for the current user (or root)
	list-services() {
		brew services list
	}

	# Run the service without starting at login (or boot).
	run-service() {
		if [ -z "$1" ]; then
			brew services run --all
		else
			brew services run "$1"
		fi
	}

	# Start the service immediately and set to launch at login (or boot).
	start-services() {
		if [ -z "$1" ]; then
			brew services start --all
		else
			brew services start "$1"
		fi
	}

	# Stop the service immediately and stop it from launching at login (or boot).
	stop-services() {
		if [ -z "$1" ]; then
			brew services stop --all
		else
			brew services stop "$1"
		fi
	}

	# Stop and start the service immediately and set to launch at login (or boot).
	restart-services() {
		if [ -z "$1" ]; then
			brew services restart --all
		else
			brew services restart "$1"
		fi
	}

	# Remove all unused services.
	cleanup-services() {
		brew services cleanup
	}

	# Update & cleanup Homebrew, Cask, MAS, and their installed packages
	alias brewup="brew update; brew outdated; brew upgrade; brew cu --all --yes --quiet; mas outdated; mas upgrade; brew cleanup; brew doctor; brew bundle dump --force --file='~/Brewfile';"
fi
