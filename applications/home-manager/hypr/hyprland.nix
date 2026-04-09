{
  imports = [
    ./bindings.nix
    ./input.nix
    ./waybar.nix
    ./hyprpaper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
