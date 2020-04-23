# Gopher Package

Gopher.pck.st implements a minimal Gopher protocol client. It
was originally ported and refactored from a gopher library written
by Christian Kellermann called Squeaky as it was originally intended
for Squeak Smalltalk.

## Install

```bash
  $ ./bin/install_gopher.sh Cuis5.0-4112.image
```

## Usage Example

Run in a Workspace
```Smalltalk
   uri _ GopherUri fromString: 'gopher://vernunftzentrum.de/'.
   GopherRegistry openUri: uri.
```
