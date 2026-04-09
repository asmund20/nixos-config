{
  imports = [
    ./bindings.nix
    ./input.nix
    ./hyprpaper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
