# Count Word

Simple package to count words, characters and lines on Atom Editor :octocat:

<a href="https://gyazo.com/86331c45087f37edb0a53cd9673e2d9a"><img src="https://i.gyazo.com/86331c45087f37edb0a53cd9673e2d9a.png" /></a>


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
