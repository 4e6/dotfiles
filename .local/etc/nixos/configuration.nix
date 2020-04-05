# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./user-configuration.nix
      /home/4e6/.config/nixpkgs/nordvpn/service.nix
      <nixos-hardware/lenovo/thinkpad/x1/6th-gen/QHD>
    ];

  nixpkgs.config.allowUnfree = true;
  services.nordvpn.enable = true;

  #boot.kernelModules = [ "thinkpad_acpi" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  #networking.enableIPv6 = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Select internationalisation properties.
  console.font = "Lat2-Terminus16";
  console.keyMap = "us";
  i18n = {
    #consoleFont = "Lat2-Terminus16";
    #consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #linuxPackages.acpi_call
    linuxPackages.cpupower
    alacritty
    aria
    emacs
    dunst
    gdb
    git
    libnotify
    lm_sensors
    lxappearance
    mkpasswd
    mpv
    neovim
    powertop
    ranger
    ripgrep
    rustup
    rxvt_unicode-with-plugins
    vim
    wget
    wpa_supplicant
    xdg_utils
    xorg.xev
    xss-lock
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    iosevka
  ];

  environment.variables = {
    TERMINAL = "urxvtc";
    EDITOR = "nvim";
    VISUAL = "nvim";
    FILE_MANAGER_APP = "urxvtc -e ranger";
    VIDEO_APP = "urxvtc -e mpv";
    # parallel xz
    XZ_DEFAULTS = "-T0";
    # colors
    #LESS = "-Xr";
    PAGER = "less";
  };

  programs.dconf.enable = true;
  programs.light.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable tlp
  services.tlp.enable = true;
  services.tlp.extraConfig = ''
    CPU_HWP_ON_AC="performance"
    CPU_HWP_ON_BAT="power"
    CPU_SCALING_GOVERNOR_ON_AC=performance
    CPU_SCALING_GOVERNOR_ON_BAT=powersave
    START_CHARGE_THRESH_BAT0=60
    STOP_CHARGE_THRESH_BAT0=80
    RESTORE_THRESHOLDS_ON_BAT=1
  '';

  services.redshift.enable = true;
  services.redshift.temperature.day = 5700;
  services.redshift.temperature.night = 2700;
  location.latitude = 55.85;
  location.longitude = 37.51;

  services.aria2.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
