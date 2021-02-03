#!/usr/bin/env bash


# Setup mobile development environment for Native and React-Native development

echo "------------------------------------------------------------------------------------------"
echo "Let the mobile side shine!"
echo "------------------------------------------------------------------------------------------"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Xcodes managing xcode versions more easely 
brew install --cask --appdir="~/Applications" xcodes

install_ios(){
  echo "------------------------------------------------------------------------------------------"
  echo "Setting up iOS"
  echo "------------------------------------------------------------------------------------------"

  # Install Xcode command line tools
  xcode-select --install

  # Add ios simulator to Applications folder
  ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

  # Install cocoapods
  brew install cocoapods
}

install_android(){
  echo "------------------------------------------------------------------------------------------"
  echo "Setting up Android"
  echo "------------------------------------------------------------------------------------------"

  # Install Android Studio
  brew install --cask --appdir="~/Applications" android-studio

  # Install android tools
  brew install gradle
  brew install android-sdk
  sdkmanager --update

  # Setup virtual device
  sdkmanager "system-images;android-29;google_apis;x86"
  sdkmanager --licenses
  touch ~/.android/repositories.cfg
  avdmanager create avd -n test_device -k "system-images;android-29;google_apis;x86"
  avdmanager list avd

  # Setup environment variables and store in bash_profile
  echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.bash_profile
  echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bash_profile
  echo 'export PATH=$PATH:$ANDROID_HOME/tools ' >> ~/.bash_profile
  echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bash_profile
  echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bash_profile
}

install_react_native(){
  echo "------------------------------------------------------------------------------------------"
  echo "Setting up React-Native"
  echo "------------------------------------------------------------------------------------------"

  # Install Node.js for React native support
  brew install node

  # Install watchman for React native support
  brew install watchman

  # Install Java JRE and JDK
  brew tap AdoptOpenJDK/openjdk
  brew install --cask adoptopenjdk8

  #install React-Native
  brew install react-native-cli
  brew link react-native-cli
}

while true; do
    read -p "Do you wish to install iOS dev environment?[y/n]: " yn
    case $yn in
        [Yy]* ) install_ios; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to install Android dev environment?[y/n]: " yn
    case $yn in
        [Yy]* ) install_android; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to install React-Native dev environment?[y/n]: " yn
    case $yn in
        [Yy]* ) install_react_native; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done