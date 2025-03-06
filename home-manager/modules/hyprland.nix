{ config, lib, pkgs, inputs, ... }:
let
  module = "hyprland";
in
{
  imports = [
    ./${module}/settings.nix
  ];
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {
    
    #
    # --- Hyprland configuration ---
    #
    
    wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
      hyprspace
      # hyprsplit
    ];

    # enable hyprland and configure to use system level package
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;         # }
      portalPackage = null;   # } allows home-manager to use the hyprland packages defined at the system level
    };

    # hint electron apps to use wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    # hyprland configuration settings module 
    settings.enable = true;   

    # hyprpaper configuration
    home.file.".wallpapers/wp1.jpg".source = ./${module}/wallpapers/wp1.jpg;
    home.file.".wallpapers/wp2.jpg".source = ./${module}/wallpapers/wp2.jpg;
    home.file.".wallpapers/wp3.jpg".source = ./${module}/wallpapers/wp3.jpg;
    home.file.".wallpapers/wp4.jpg".source = ./${module}/wallpapers/wp4.jpg;
    home.file.".wallpapers/wp5.jpg".source = ./${module}/wallpapers/wp5.jpg;

    services.hyprpaper = {
      enable = true;
      settings =  
      let
        wallpapers_path = "$HOME/.wallpapers/";
        wp1 = "${wallpapers_path}/wp1.jpg";
        wp2 = "${wallpapers_path}/wp2.jpg";
        wp3 = "${wallpapers_path}/wp3.jpg";
        wp4 = "${wallpapers_path}/wp4.jpg";
        wp5 = "${wallpapers_path}/wp5.jpg";
        wpa = wp3; # active wallpaper
      in
      {
        preload = [ wpa ];
        
        wallpaper = [
          "VGA-1, ${wpa}"
          "DVI-D-1, ${wpa}"
        ];
      };
    };

    # waybar configuration
    programs.waybar = { 
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
         /*  output = [
            "eDP-1"
            "HDMI-A-1"
          ]; */
          modules-left = [ "hyprland/workspaces" "hyprland/mode" "wlr/taskbar" ];
          modules-center = [ "hyprland/window" "custom/hello-from-waybar" ];
          modules-right = [ "mpd" "custom/mymodule#with-css-id" "network" "pulseaudio" "bluetooth" "clock"];

          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
          /* "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          }; */
        };
      }; 
    }; 
  };
}
