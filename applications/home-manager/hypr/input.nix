{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      hl.config({
        input = {
          kb_layout = "no",
          kb_variant = "", --"nodeadkeys",
          kb_model = "",
          kb_options = "",
          kb_rules = "",
          repeat_rate = 40,
          repeat_delay = 600,
          sensitivity = 0,

          follow_mouse = 1,

          touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
            clickfinger_behavior = true,
          },
        },
        cursor = {
          hide_on_key_press = true,
        },
      })

      hl.device({
        name = "compx-mad-8k-dongle-1",
        sensitivity = -0.7,
      })
    '';
  };
}
