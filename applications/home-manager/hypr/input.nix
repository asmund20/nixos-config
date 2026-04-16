{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "no";
        kb_variant = "nodeadkeys";
        repeat_rate = 40;
        repeat_delay = 600;
        # TODO: do the sensitivity in extra-config for the gaming mouse,
        # instead of setting all other mice to sensitivity zero
        sensitivity = -0.7;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.5;
          clickfinger_behavior = true;
        };
      };
      cursor = {
        hide_on_key_press = true;
      };
    };
    extraConfig = ''
      device {
        name = dell0b43:00-04f3:3185-touchpad
        sensitivity = 0
      }
      device {
        name = apple-inc.-magic-trackpad
        sensitivity = 0
      }
    '';
  };
}
