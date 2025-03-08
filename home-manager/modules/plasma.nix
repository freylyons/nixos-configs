{ ... }:
{
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
    };
}
