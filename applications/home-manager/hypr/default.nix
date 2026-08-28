{
  imports = [
    ./bindings.nix
    ./hypridle.nix
    ./hyprlauncher.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./input.nix
    ./misc.nix
    ./monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };
}
