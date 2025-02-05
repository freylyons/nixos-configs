{ config, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
#   home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

  # declare user settings here
  home-manager.users.frey = { pkgs, ... }: {

    home.stateVersion = "23.11";

    #
    # program settings
    #

    programs.git = {
      enable = true;
      userName = "Frey";
      userEmail = "freylyons@hotmail.co.uk";
    };

    #
    # desktop settings
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
