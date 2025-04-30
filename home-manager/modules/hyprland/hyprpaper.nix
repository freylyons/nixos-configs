{ config, lib, ... }:
let
  module = "hyprpaper";
  fileSource = ./wallpapers;
in
{
  options = {
    ${module}.enable = lib.mkEnableOption "enables the ${module} home-manager configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    # copy wallpaper source files onto system
    home.file.".wallpapers/wp1.jpg".source = "${fileSource}/wp1.jpg";
    home.file.".wallpapers/wp2.jpg".source = "${fileSource}/wp2.jpg";
    home.file.".wallpapers/wp3.jpg".source = "${fileSource}/wp3.jpg";
    home.file.".wallpapers/wp4.jpg".source = "${fileSource}/wp4.jpg";
    home.file.".wallpapers/wp5.jpg".source = "${fileSource}/wp5.jpg";

    # configure wallpaper display
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
        wp6 = "${wallpapers_path}/wp6.jpg";
        wp7 = "${wallpapers_path}/wp7.jpg";
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
  };
}
