{
  imports = [
    ./bindings.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./misc.nix
    ./monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = hyprlauncher -d
    '';
  };
}
