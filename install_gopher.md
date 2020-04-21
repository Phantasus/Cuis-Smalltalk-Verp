# Install Gopher

This file contains the "install guide" for the gopher package.
It's assumed that these steps are followed within the directory
holding the Gopher.pkg.st files.


# Get compatible dependencies

Put depending packages inside the directory of the loading image
or install these through different sources by hand. Here is a bash
snippet which downloads the current state of dependencies.

```bash
  wget https://raw.githubusercontent.com/pbella/OMeta-Cuis/master/OMeta2.pck.st
  wget https://raw.githubusercontent.com/pbella/OMeta-Cuis/master/OMeta2Preload.st
  wget https://raw.githubusercontent.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/master/Packages/System/Network-Kernel.pck.st
```

# Run inside a workspace

```smalltalk
  Preferences disable: #warnAboutNonLocalReturnsInExceptionHandlers.
  Feature require: 'OMeta2'.
  Feature require: 'OMeta2UriParser'.
  Feature require: 'URI-Kernel'.
  Feature require: 'Gopher'.

  uri _ GopherUri fromString: 'gopher://vernunftzentrum.de/'.
  GopherRegistry openUri: uri.
```
