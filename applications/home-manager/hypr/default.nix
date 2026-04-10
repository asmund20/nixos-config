{
  imports = [
    ./bindings.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./misc.nix
    ./monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
