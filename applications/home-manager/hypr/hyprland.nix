{
  imports = [
    ./bindings.nix
    ./input.nix
    ./waybar.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
