#!/bin/bash

#  coreos-vagrant-install.command
#  CoreOS GUI for OS X
#
#  Created by Rimantas on 01/04/2014.
#  Copyright (c) 2014 Rimantas Mocevicius. All rights reserved.

    # create "coreos-osx" and other required folders and files at user's home folder where all the data will be stored
    mkdir ~/coreos-osx
    mkdir ~/coreos-osx/coreos-vagrant
    mkdir ~/coreos-osx/tmp
    mkdir ~/coreos-osx/bin
    mkdir ~/coreos-osx/share
    mkdir ~/coreos-osx/fleet

    # download latest coreos-vagrant
    rm -rf ~/coreos-osx/github
    git clone https://github.com/coreos/coreos-vagrant/ ~/coreos-osx/github

    # cd to App's Resources folder
    cd "$1"

### Vagrantfile ###
    cp ~/coreos-osx/github/Vagrantfile ~/coreos-osx/coreos-vagrant/Vagrantfile

    # change IP to static
    sed -i "" 's/172.17.8.#{i+100}/172.17.8.99/g' ~/coreos-osx/coreos-vagrant/Vagrantfile

### Vagrantfile ###

### user-data file ###
    cat ~/coreos-osx/github/user-data.sample user-data > ~/coreos-osx/coreos-vagrant/user-data

    # config.rb file
    cp ~/coreos-osx/github/config.rb.sample ~/coreos-osx/coreos-vagrant/config.rb

    # expose docker port
    sed -i "" 's/#$expose_docker_tcp/$expose_docker_tcp/' ~/coreos-osx/coreos-vagrant/config.rb
### user-data file ###

    # initial init
    open -a iTerm.app "$1"/first-init.command "$1"
