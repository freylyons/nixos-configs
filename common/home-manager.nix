{ config, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
#   home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

  # declare user settings here
  home-manager.users.frey = { pkgs, ... }: {

    home.stateVersion = "23.11";

    #
    # --- program settings---
    #

    programs.git = {
      enable = true;
      userName = "Frey";
      userEmail = "freylyons@hotmail.co.uk";
    };

    # --- set up firefox configuration ---
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.profiles
    # firefox uses profiles to store configuration information (bookmarks, passwords, and extensions), so recreating my firefox environment declaratively here will be done through that mechanism


    # --- set up dolphin configuration ---
    # https://nix-community.github.io/home-manager/options.xhtml#opt-home.file._name_.text
    # dolphin is configured using the dolphinrc configuration file in ~/.config/dolphinrc. Use `home.file.<name>.text` to write the file output (replace <name> with the path in the home directory). Using this method might create issues for changing settings manually, as it is stored in a read only location according to chatgpt.

    # also consider using kwriteconfig6 https://nix-community.github.io/home-manager/options.xhtml#opt-qt.kde.settings
    # this passes options to a built in function to alter settings by (seemingly) altering existing config files. This might be a better option long term.
    #     home.file.".config/dolphinrc".text = ''
    #       [Terminal]
    #       ShowTerminal=true
    #       TerminalPosition=2
    #
    #       [KFileDialog Settings]
    #       Show hidden files=true
    #     '';
    #     home.file.".local/share/kfileplaces/bookmarks.xml".text = ''
    #       <?xml version="1.0" encoding="UTF-8"?>
    #       <bookmarks>
    #         <bookmark href="file:///home/frey/files/documents" icon="folder-documents" id="Documents" />
    #         <bookmark href="file:///home/frey/downloads" icon="folder-download" id="Downloads" />
    #         <!-- Add more bookmarks as needed -->
    #       </bookmarks>
    #     '';


    #
    # --- desktop settings ---
    #

    programs.plasma = {
      enable = true;

      # Global themes, colorschemes, icons, cursortheme, wallpaper (via the workspace module)
      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop"; # set the theme
      };


      # Shortcuts (via the shortcuts module)
      shortcuts = {
        kwin = {
          "Window Maximize" = "Meta+Shift+Up";
          "Window Minimize" = "Meta+Shift+Down";
          "Window One Screen to the Right" = "Meta+Shift+Right";
          "Window One Screen to the Left" = "Meta+Shift+Left";
        };
      };

      # KDE configuration files (via the files module) # todo: setup dolphin settings
#       files = {
#         dolphinrc = {
#           IntegratedTerminal = true;
#         };
#       };
    };
  };

  # find some way to define inheritance of similar settings between users?

  # append items to lists with ++
  # alter sets attributes with // {new1 = , new2 = , overwrite3 = , etc.}
}
