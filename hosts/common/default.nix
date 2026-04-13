{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ../../applications/native/kanata.nix
    ../../applications/native/zen.nix
  ];
  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.limine.enable = true;

  networking.hostName = lib.mkDefault "asmund nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };

    defaultSession = "hyprland";
  };

  # Enable HYPRLAND
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Configure console keymap
  console.keyMap = "no";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asmund = {
    isNormalUser = true;
    description = "Åsmund";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users = {
      "asmund" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    nushell
    spotify
    unzip
    btop
    rofi
    bat
    python3
    typst
    tree
    ghc
    cabal-install
    brightnessctl
    pamixer

    # lsps and other neovim depenencies
    nil
    nixfmt
    tinymist
    websocat
    haskell-language-server
    jdt-language-server
  ];

  environment.shells = [
    pkgs.nushell
  ];

  programs.bash.interactiveShellInit = ''
    if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
      exec nu
    fi
  '';

  systemd.services."lock-before-sleep" = {
    description = "Lock all sessions before sleep";

    # Run as root, but use loginctl which knows which sessions to lock
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [ "${pkgs.systemd}/bin/loginctl lock-sessions" ];
    };

    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
