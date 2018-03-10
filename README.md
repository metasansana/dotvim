# dotvim

> Vim folder and configuration files used by Quenk Technologies. 

## Installation

Clone this repo somewhere on your machine. 

Optionally cd into the directory and run `git submodule update --recursive` in the folder.

Create symlinks to the `.vim` and `.vimrc` folders. Place those symlinks in your `$HOME` folder. 

## Setup

Most of the plugins work out of the box but YouCompleteMe requires various setup steps. 
See their [documentation](https://github.com/Valloric/YouCompleteMe).

## Concepts

Configuration is done in the [.vim/vimrc.d](.vim/vimrc.d) folder. There are files for common things
like [editing.vim](.vim/vimrc.d/editing.vim) and configuration files for various plugins.

When adding a new plugin that requires configuration, create a `.vim` file with its name and
remember to include comments as to what it does.

### .vimlocal

The `.vimrc` file contains a script that attempts to source a file called `.vimlocal` in your project root if it exists.
Use this to do things like run `autocmd`s when you save a file etc.

## Languages

Out of the box we have support for less, javascript and TypeScript and a few other languages used at QT.
When setting up configuration for new languages, create a new branch for that language and install
whatever plugins needed etc.

This will help keep startup complexity low when using this repo in virtual machines etc. tailored for only
developing one language.

General settings and plugins should remain in the master branch.
