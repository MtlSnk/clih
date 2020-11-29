# CLIH (CLI helpers)

Starting to turn into some sort of a framework for scripts with autocompletion.\
Most of the 'heavy lifting' is currently done by the user.

Some Bash (autocompletion) knowledge is required.

Might be useful, YMMV.

## Getting started

Clone the repo.

```
git clone https://github.com/MtlSnk/clih.git
```

Edit `.clihrc` with the paths to your scripts/autocompletion directories.

```bash
# .clihrc
SCRIPTS_DIR="$HOME/scripts"             # scripts dir
COMPLET_DIR="$SCRIPTS_DIR/completion"   # tab-/autocompletion dir
```

Source `.clihrc` in your `.bashrc` or similar.

```bash
echo 'source "$HOME/.clihrc"' >> $HOME/.bashrc
```

Try the example CLIH or start creating scripts yourself.

## Example CLIH

### Markdown previewer (mdp)

This CLIH provides a minimalistic preview for Markdown in the command line.\
Its dependencies:

- pandoc
- lynx

It'll tell you if deps are missing, arguments are invalid and it'll provide
custom-tailored autocompletion, have a look at [the script](scripts/mdp.sh) and
[the autocompletion](scripts/completion/mdp).

Use it in a directory that contains at least one Markdown file.\
For instance, use it the repo you just cloned as such:

```
mdp<TAB><TAB><ENTER>
```

## Write your own CLIHs!

Bash-terries not included. Currently you're on your own.

Don't forget to add your script to the whitelist in `.clihrc`:

```bash
# Whitelist of scripts to consider 'helpers'
CLIH+=(mdp)   # Markdown preview
```
