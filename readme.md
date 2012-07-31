# Sheldon Setup

## Setup XCode and X11
Install XCode 4.4 (Get it from the App Store).

###Install Command Line Tools

In XCode's Preferences > Downloads you can install command line tools.

### Let Everyone Know Where XCode Is

	sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

### Install X11

Visit <http://xquartz.macosforge.org/trac/wiki> and download and install 2.7.2+.

You will need to fix the symlink it makes:

	ln -s /opt/X11 /usr/X11

## Install Homebrew

	/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
	
Run brew doctor afterwards to make sure everything is as it should be

	brew doctor
		
## Install essential packages

	# Install GNU core utilities (those that come with OS X are outdated)
	brew install coreutils
	
	# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
	brew install findutils
	
	# Install wget with IRI support
	brew install wget --enable-iri
	
	# Install more recent versions of some OS X tools
	brew tap homebrew/dupes
	brew install homebrew/dupes/grep
	
	# Install everything else
	brew install ack
	brew install git
	
	brew install htop
	# remember to give htop proper permissions
	# so it wont be necessary to sudo
	
	brew install libxml2
	brew link libxml2
	
	# Do cleanup to get rid of outdated kegs
	brew cleanup
		
## Get dotfiles

	# Get the repo
	git clone git://github.com/ksmandersen/dotfiles.git
	cd dotfiles
	
	# Run the bootstrap
	chmod u+x bootstrap.sh
	sh bootstrap.sh
	
## Install PHP 5.4
See [http://php-osx.liip.ch/](http://php-osx.liip.ch/)

	curl -s http://php-osx.liip.ch/install.sh | bash -s 5.4
	
## Install MySQL
See [http://coolestguyplanettech.com/downtown/install-and-configure-apache-mysql-php-and-phpmyadmin-osx-108-mountain-lion](http://coolestguyplanettech.com/downtown/install-and-configure-apache-mysql-php-and-phpmyadmin-osx-108-mountain-lion)

## Install rbenv

	# Clone the rep
	git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
	
	# Restart shell
	exec $SHELL
	
	# Install latest ruby
	rbenv install 1.9.3-p194
	rbenv rehash
	rbenv global 1.9.3-p194