Bootstrap
=========

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `bootstrap` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

### But...I Don't Need All These Tools!

**`bootstrap` is geared to be more of an organized *reference* of various developer tools.**

If you're interested in automation, `bootstrap` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

### Sections Summary
* Section 1 contains the dotfiles/scripts and instructions to set up your system.
* Sections 2 through 7 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/danieldop/bootstrap.git && cd bootstrap

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

Run `osxprep.sh`, `brew.sh`, and `osx.sh`:
```bash
./.dots osxprep brew osx
```

Run `osxprep.sh`, `brew.sh`, and `osx.sh`, and `datastores.sh`:
```bash
./.dots osxprep brew osx datastores
```

#### Scripts

* [osxprep.sh](https://github.com/danieldop/bootstrap/blob/master/osxprep.sh)
    * Updates OS X and installs Xcode command line tools
* [brew.sh](https://github.com/danieldop/bootstrap/blob/master/brew.sh)
    * Installs common Homebrew formulae and apps
* [osx.sh](https://github.com/danieldop/bootstrap/blob/master/osx.sh)
    * Sets up OS X defaults geared towards developers
* [web.sh](https://github.com/danieldop/bootstrap/blob/master/web.sh)
    * Sets up JavaScript web development
* [server.sh](https://github.com/danieldop/bootstrap/blob/master/server.sh)
    * Sets up Java development
* [ops.sh](https://github.com/danieldop/bootstrap/blob/master/ops.sh)
    * Sets up K8s & Helm development

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `.dots` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `.dots` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**
