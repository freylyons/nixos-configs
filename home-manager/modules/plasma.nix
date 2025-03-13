{ config, lib, ... }:
let 
  module = "plasma";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    programs.plasma = {
        enable = true;

        # Global themes, colorschemes, icons, cursortheme, wallpaper (via the workspace module)
        workspace = {
            lookAndFeel = "org.kde.breezedark.desktop"; # set the theme
        };


        # Shortcuts (via the shortcuts module)
        shortcuts = {
            kwin = {
            # window modification
            "Window Maximize" = "Meta+Up";
            "Window Minimize" = "Meta+Down";
            "Window One Screen to the Right" = "Meta+Shift+s";
            "Window One Screen to the Left" = "Meta+Shift+f";
            "Window One Desktop Up" = "Meta+Shift+e";
            "Window One Desktop Down" = "Meta+Shift+d";

            "Window Quick Tile Left" = "Meta+s";
            "Window Quick Tile Right" = "Meta+f";
            "Window Quick Tile Top" = "Meta+e";
            "Window Quick Tile Bottom" = "Meta+d";

            # window view
            "Switch One Desktop to the Right" = "Meta+Shift+i";
            "Switch One Desktop to the Left" = "Meta+Shift+k";
            "Switch to Screen to the Left" = "Meta+Shift+j";
            "Switch to Screen to the Right" = "Meta+Shift+l";

            "Switch Window Left" = "Meta+j";
            "Switch Window Right" = "Meta+l";
            "Switch Window Up" = "Meta+i";
            "Switch Window Down" = "Meta+k";           
            
            # extra
            "Show Desktop" = "Meta+Alt+d";

        };
        ksmserver = {
          "Lock Session" = "Meta+Alt+l";
        };
        plasmashell = {
          # "activate application launcher" = "Meta+space";
        };
      };
    };
  };
}
