{ lib, config, ... }:
let
  module = "users-default";
in
{
  imports = [
    ./frey.nix
    ./gaming.nix
  ];

  options = {
    ${module}.enable = lib.mkEnableOption "Enable the ${module} configuration on the system";
  };

  config = lib.mkIf config.${module}.enable {

    # default user account activations
    users.frey.enable = lib.mkDefault true;
    users.gaming.enable = lib.mkDefault false;
  };
}
