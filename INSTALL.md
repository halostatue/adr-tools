# Installation

## From a Release Package (Linux, macOS)

You can install a release package:

1. Download a zip or tar.gz package from the [releases page][].
2. Unzip / untar the package
3. Add the 'src/' subdirectory to your PATH

## From Git (Linux, macOS)

You can install with Git, if you want to be on the bleeding edge:

1. Clone this repository
2. Add the `src/` subdirectory to your PATH.

## Windows

### Git for Windows: git bash

When using git bash within [Git for Windows][], the scripts can be put in
`usr\bin` in the installation directory. That directory usually is `C:\Program
Files\Git\usr\bin`.

1. Download a zip package from the [releases page][].
2. Unzip the package
3. Copy everything from `src/` into `C:\Program Files\Git\usr\bin`
4. This expects to run in a standard POSIX environment, so you must also
   install `more` or set the `PAGER` environment variable to `less`.

### Linux subsystem

The scripts work in the Bash on [Ubuntu on Windows][], the Linux-subsystem that
officially supports Linux command line tools.

Make sure that you have [installed][installed-wsl] the Linux-subsystem, run
`bash` on the command line and follow the instructions in the "From a Release
Package" section above.

## Autocomplete

In order to have autocomplete on the commands, add the `autocomplete/adr` script
to your `/etc/bash_autocomplete.d` or the equivalent to your platform.

[releases page]: https://github.com/halostatue/adr-tools/releases
[Git for Windows]: https://git-for-windows.github.io/
[Ubuntu on Windows]: https://www.microsoft.com/store/p/ubuntu/9nblggh4msv6
[installed-wsl]: https://msdn.microsoft.com/en-us/commandline/wsl/install_guide
