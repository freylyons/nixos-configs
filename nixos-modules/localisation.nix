{ config, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    #font = "fira-code";
    keyMap = "uk";
    #useXkbConfig = true; # use xkb.options in tty.
  };
}
