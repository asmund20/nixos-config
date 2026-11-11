{
  imports = [
    ./bindings.nix
    ./hypridle.nix
    ./hyprlauncher.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./look.nix
    ./monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };
}
