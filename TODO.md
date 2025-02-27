# TODO

## Macro

    5)  examine the possibility of creating a neovim configuration. 
    
    Can Users be modularised?
    Can unfree predicates be modularised?
    Home Manager for User Side Applications? Maybe set desktop applications to false by default?

## Micro

    1)  Refactor the common/default.nix into a series of modules by purpose. Sort the modules into directories by types (services, programs, etc.)
    2)  Use default.nix purely to load modules into the default configuration
    3)  alter the configuration.nix files to use the default.nix and enable/disable modules on the system as necessary
    4)  simplify the flake.nix file to specify the configuration for each host, rather than specifying/importing the modules there.

    
    
