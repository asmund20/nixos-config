{
  imports = [
    ./bindings.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./mako.nix
    ./misc.nix
    ./monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
