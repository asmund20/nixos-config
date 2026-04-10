{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "no";
        repeat_rate = 40;
        repeat_delay = 600;
        sensitivity = -0.7;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.5;

        };
      };
      cursor = {
        hide_on_key_press = true;
      };
    };
    extraConfig = ''
      device {
        name = dell0b43:00-04f3:3185-touchpad
        sensitivity = -0.2
      }
    '';
  };
}
