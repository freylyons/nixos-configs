# Documentation

> Version control: Valid as of commit 8e455405e3e54f5ffa885511947d6fc6ce607441

This is a NixOS config using flakes designed to define build instructions for multiple systems sharing common attributes. The design philosophy is modular, aiming to use Nix's declarative approach to produce a desktop environment with the same user settings across machines, while having a single place to maintain machine specific configurations. The machines defined here are my desktop and my laptop.


## 1. Basic file structure

./   <br />
├── common  <br />
│   ├── default.nix <br />
│   ├── home-manager.nix    <br />
│   ├── networking.nix   <br />
│   └── users.nix   <br />
├── hosts   <br />
│   ├── desktop   <br />
│   │   ├── configuration.nix   <br />
│   │   ├── extra.nix   <br />
│   │   └── hardware-configuration.nix   <br />
│   └── laptop   <br />
│       ├── configuration.nix   <br />
│       ├── extra.nix   <br />
│       └── hardware-configuration.nix   <br />
├── flake.nix   <br />
├── flake.lock   <br />
└── README.md   <br />



## 2. File structure breakdown

Throughout this section `./` is used to refer to the root of the project tree.

### 2.1 `common`

This is the location for modules which generalise across machines.

#### 2.1.1 `default.nix`

Contains the default settings. This includes default packages which are included across machines. Does not include any desktop environment packages, which are declared for specific users in `./common/users.nix`.

#### 2.1.2 `home-manager.nix`

Contains the user settings.

#### 2.1.3 `networking.nix` [WIP]

Redundant file which theoretically will specify networking connections for machines. May be refactored as machine specific configs (16/02/2025).

#### 2.1.4 `users.nix`

Defines the users which will remain consistent across machines. Designed to provide ease of use for daily tasks, although specific use cases may allow for additional host specific users to be configured on machines.

### 2.2 `hosts`

This contains directories of modules which are specific to each machine. Files in each of these directory follow the structure.

* `configuration.nix` - system build instructions (takes modules as inputs and produces a NixOS build).
* `extra.nix` - additional configurations not specified in the default configuration.
* `hardware-configuration.nix` - configuration for the machine-specific hardware.


### 2.3 `flake.nix`

The flake file for the system. Contains module combinations for each system.

### 2.4 `flake.lock`

The lock file for the system. Details the exact package versions currently installed.
