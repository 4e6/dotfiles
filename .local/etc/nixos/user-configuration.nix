# User configuration.

{ config, pkgs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us,ru";
  services.xserver.xkbVariant = ",phonetic";
  services.xserver.xkbOptions = "grp:shift_toggle,grp_led:scroll";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable urxvt daemon
  services.urxvtd.enable = true;

  # Enable i3wm
  #services.xserver.desktopManager.default = "none";
  #services.xserver.displayManager.auto.enable = true;
  #services.xserver.displayManager.auto.user = "4e6";
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xset}/bin/xset r rate 200 30;
    ${pkgs.xorg.xset}/bin/xset -dpms;
    # disable beep
    ${pkgs.xorg.xset}/bin/xset -b;
    ${pkgs.xorg.xset}/bin/xrdb -merge ~/.Xresources;
  '';
  #services.xserver.windowManager.default = "i3";
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "4e6";
  services.xserver.windowManager.i3.enable = true;

  # User settings
  users.mutableUsers = false;
  # Define a user accounts.
  users.users = {
    "root" = {
      hashedPassword = "$6$72GBShaM$Azo1Hyzz/xQd7C5yA/9PyiUaSiW/4o7lwgg8mybYPCu7mQhOy9PZPm1jAdJIK9FZb5FtNF9K03luv0WgskH.r.";
    };
    "4e6" = {
      isNormalUser = true;
      extraGroups = [ "adm" "audio" "input" "keys" "lp" "networkmanager" "utmp" "video" "wheel" ];
      hashedPassword = "$6$FV3IDrJTPb$Zkygw.uww8fU5NbucXRh4FSke3tJV7PiYKEa56T88xZZvhjCkFty3woJS22ZrX0KF1iD3ZKShpCkUKBS.I2bS.";
      packages = [
        (pkgs.chromium.override { commandLineArgs = "--force-device-scale-factor=1.5"; })
      ];
    };
  };

}
