# Count Word

Simple package to count words, characters and lines on Atom Editor :octocat:

<a href="https://gyazo.com/fc375c1d169e3fc06b8f3d45836e7931"><img src="https://i.gyazo.com/fc375c1d169e3fc06b8f3d45836e7931.png" width="500" /></a>

Install via command line `$ apm install count-word`, or via 'Install' from Atom's settings menu.

## Usage

From command palette <kbd>cmd-shift-p</kbd>, use command `Count Word:Toggle`.

Default keymap is <kbd>ctrl-alt-w</kbd>.  
You can change the keymap by editing `keymap.cson` like this:

```
'atom-workspace':
  'your-favorite-key': 'count-word:toggle'
```

## Tasks

- [x] Count selected words  
- [ ] Close button on modal  
