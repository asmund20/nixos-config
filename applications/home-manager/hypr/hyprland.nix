{
  imports = [
    ./bindings.nix
    # ./hyprpaper.nix
    ./input.nix
    ./misc.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
