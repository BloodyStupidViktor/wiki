# Wiki

## Dotfiles

Includes generic configuration files for Bash (including prompt customizatioin), Git (including bash completion and utility aliases), and other.

### Usage

Extend your files with anything you need from the provided files.

It seems best to simply source any additions in the original files, as opposed to copying over the functionality. That way the generic logic is kept separate and easy to identify and track.
```
if [ -f path to dotfiles/.bash_prompt ]; then
    . path to dotfiles/.bash_prompt
fi
```

You can extend your _.gitconfig_ files by including external files, e.g.:
```
[include]
    path = path to dotfiles/.gitconfig
```