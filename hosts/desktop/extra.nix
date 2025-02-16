{ config, lib, pkgs, ... }:

{
  # in here put the changes to configuration settings for monitors, etc.
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "nvidia"
             "nvidia-x11"
             "nvidia-settings"
             "discord"
             "steam"
             "steam-unwrapped"
           ];

  # possibly add gaming user configuration here


  #
  # --- postgres configuration ---
  #

  # create a server user
  # note: theoretically I want this to act as a "root" user for the service and store the data in the home directory, however I'm having issues with changing the directory (see services.postgresql.dataDir). For now this user exists purely to create a directory in which the backups folder can go (see services.postgresqlBackup).
  users.users.postgres_server = {
    isNormalUser = true;
    home = "/home/postgres_server";
    extraGroups = [ "wheel" "networkmanager" ];
  };


  # set up postgres service
  services.postgresql = let
      home = config.users.users.postgres_server.home;
      # home = "/var/postgres_server";
    in
    {
    enable = true;
    package = pkgs.postgresql_17;
    # dataDir = "${home}/data"; # permission/directory errors when changing data dir. As stated in nixpkgs docs I need to find a way of creating the directory properly. [1]
    checkConfig = true; # ensure the configs are correctly declared on compile
    authentication = ""; # change pg_hba.conf [2]
    identMap = "";
    initialScript = null; # [3]

    # [1] https://search.nixos.org/options?channel=24.11&show=services.postgresql.dataDir&from=50&size=50&sort=alpha_desc&type=packages&query=postgres
    # [2] https://search.nixos.org/options?channel=24.11&show=services.postgresql.authentication&from=0&size=50&sort=alpha_desc&type=packages&query=services.postgresql
    # [3] https://search.nixos.org/options?channel=24.11&show=services.postgresql.initialScript&from=0&size=50&sort=alpha_desc&type=packages&query=services.postgresql


    settings = { # https://search.nixos.org/options?channel=24.11&show=services.postgresql.settings&from=0&size=50&sort=alpha_desc&type=packages&query=services.postgresql

      #
      # --- connections and authentication ---
      #

      # connection settings (note: `lib.mkForce` is required to overwrite defaults declared in other places)
      listen_addresses = lib.mkForce "*";
      port = 5432;

      # authentication
      password_encryption = "scram-sha-256";

      # SSL
      ssl = "off";

      #
      # --- file locations ---
      #
      # note: issues when changing from defaults

      # data_directory = lib.mkForce "${home}/data";          # note: `lib.mkForce` is required to overwrite defaults declared in other places
      # config_file = lib.mkForce "${home}/postgresql.conf";
      # hba_file = lib.mkForce "${home}/pg_hba.conf";
      # ident_file = lib.mkForce "${home}/pg_ident.conf";

      #
      # --- logging ---
      #

      # where to log
      log_destination = lib.mkForce "syslog";
      logging_collector = true;
      # log_directory = lib.mkForce "${home}/logs";

      # what to log
      log_checkpoints = true;
      log_connections = true;
      log_disconnections = true;
      log_error_verbosity = "DEFAULT";
      log_statement = "all";
    };

  };

  # enable postgres backups
  services.postgresqlBackup = {
    enable = true;
    location = "${config.users.users.postgres.home}/backups";
    backupAll = true;
    startAt = "*-*-* 01:15:00";
  };

}
