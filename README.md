# .emacs.d
my emacs configuration

## Sources

This list is incomplete.

https://www.emacswiki.org/emacs?interface=en
https://github.com/purcell/emacs.d
http://aaronbedra.com/emacs.d/
https://github.com/racer-rust/emacs-racer
http://julienblanchard.com/2016/fancy-rust-development-with-emacs/
https://manenko.com/2016/08/03/setup-emacs-for-rust-development.html

## Acquiring later emacs versions on ubuntu

The kelleyk repo will enable emacs 25 and 26.

```
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26
```

## Troubleshooting

A good number of problems can be solved by deleting all *.elc files to refresh the bit compilation.
Some files depend on others but their bit files are not necessarily updated when their dependencies' are.

Though it is supposed to be called every time a package needs to be installed, this functionality may not be working as intended so it may help to also manually call `M-x package-refresh-contents`.
