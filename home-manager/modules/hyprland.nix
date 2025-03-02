{ config, lib, pkgs, inputs, ... }:
let
  module = "hyprland";
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    wayland.windowManager.hyprland.plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprspace
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprsplit
    ];

    wayland.windowManager.hyprland.settings = {
      enable = true;
      "$mainMod" = "SUPER";
      bind = [
        "# Open rofi"
        "$mainMod, SPACE, exec, rofi, -show, drun, -show-icons"

        "# Move focus with mainMod + arrow keys"
        "$mainMod, left, movefocus, l"      
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
  
        "# Moving windows"
        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up, swapwindow, u"
        "$mainMod SHIFT, down, swapwindow, d"

        "# Window resizing                     X  Y"
        "$mainMod CTRL, left, resizeactive,   -60 0"
        "$mainMod CTRL, right, resizeactive,   60 0"
        "$mainMod CTRL, up, resizeactive,      0 -60"
        "$mainMod CTRL, down, resizeactive,    0  60"

        "# Move active window to a workspace with mainMod + SHIFT + [0-9]"
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 10, movetoworkspacesilent, 10"
  
        "# Special workspace (scratchpad)"
        "$mainMod SHIFT, S, movetoworkspacesilent, special:magic"
      ];
    };
  };

}
