Bootstrap
=========

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.
`bootstrap` aims to **simplify** the process through a highly automatic and autonomous process.

>**`bootstrap` is geared to be an organized *reference* of various developer tools used by me.**

An opinionated list of tools, languages, shells and .dotfiles I use to configure my workstation.
This purpose of this repository is to host a tool to bootstrap my machine from scratch.
It ensures my machine is ready for backend and frontend development on kubernetes based production environments.

> I've been using a form of this script for over 10 years now. This is truly more about the journey than the destination!

## Getting Started

To run the script just hit: `curl -L https://git.io/JD0YW | sh`

>Before you get started make sure you give full disk access permission to your terminal (for writing macos .dotfiles).
>`System Preferences -> Privacy -> Full Disk Access`.

This will execute [run.sh](run.sh) which will fetch this repo and then execute the [bootstrap.sh](bootstrap.sh) script.
From there on all sections of this script will be executed.

>This script is intended for `arm64` based MacOS running computers.

## Functionality Overview

The script is structured by means modules (directories) bundled together in functionality which is then executed by a
function call from within [bootstrap.sh](bootstrap.sh). The three main buckets are:

### MacOs
- Updates the OS (optional)
- Installs OS level dependencies like xcode-cli
- Applies OS level configurations (look and feel)
### Brew
- Installs Brew
- Installs Casks and Bottles
- Configures the tools installed by Brew
### Dotfiles
- Defines `zsh` as the default shell
- Configures the shell through dotfiles
- Define aliases and exports
- Configures shell tools through dotfiles

## Issues
Further improvements I'm planning to implement:

- Collaboration
- Customization
