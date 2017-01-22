#!/bin/bash

#Mac OS Rails development enviroment setup automation script for essential tools.

TOOLS_ARRAY=( "XCode:xcode-select --install && brew tap homebrew/dupes && brew install libxml2 libxslt libiconv && brew update"
            "install rvm:gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3\curl -sSL https://get.rvm.io && source ~/.rvm/scripts/rvm"      
        "Ruby 2.3.1:rvm install 2.3.1"
        "Rails 4.2.7:gem install rails 4.2.7"
        "Bundler:gem install bundler "
        "Git:brew install git"
        "MySQL:brew install mysql && mysql.server start && mysql_secure_installation"
        "PostgreSQL: brew install postgresql"
        "Redis:brew install redis"
        )

for tool in "${TOOLS_ARRAY[@]}" ; do
  TOOL_NAME=${tool%%:*}
  INSTALL_COMMAND=${tool#*:}
  while true; do
    read -p "Do want to install $TOOL_NAME? (yes/no) ";
    if [[ $REPLY == y* || $REPLY == Y* ]]; then
      eval $INSTALL_COMMAND
      break;
    elif [[ $REPLY == n* || $REPLY == N* ]]; then
      break;    
    else
      echo "Dude, please enter yes or no."
    fi
  done
done