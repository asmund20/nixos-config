{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        # Open stuff
        "SUPER, RETURN, exec, ghostty"
        "SUPER, T, exec, ghostty --command=nu"
        "SUPER, B, exec, zen"
        "SUPER, SPACE, exec, rofi -show drun -show-icons"

        # Hyprlock
        "SUPER, L, exec, hyprlock"

        # Move focus and windows
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Move workspace to other monitor
        "SUPER SHIFT ALT, left, movecurrentworkspacetomonitor, l"
        "SUPER SHIFT ALT, right, movecurrentworkspacetomonitor, r"
        "SUPER SHIFT ALT, up, movecurrentworkspacetomonitor, u"
        "SUPER SHIFT ALT, down, movecurrentworkspacetomonitor, d"

        # Switch window with the one next to it
        "SUPER SHIFT, left, swapwindow, l"
        "SUPER SHIFT, right, swapwindow, r"
        "SUPER SHIFT, up, swapwindow, u"
        "SUPER SHIFT, down, swapwindow, d"

        # Switch workspace
        "SUPER, code:10, workspace, 1"
        "SUPER, code:11, workspace, 2"
        "SUPER, code:12, workspace, 3"
        "SUPER, code:13, workspace, 4"
        "SUPER, code:14, workspace, 5"
        "SUPER, code:15, workspace, 6"
        "SUPER, code:16, workspace, 7"
        "SUPER, code:17, workspace, 8"
        "SUPER, code:18, workspace, 9"
        "SUPER, code:19, workspace, 10"

        # Move active window to workspace
        "SUPER SHIFT, code:10, movetoworkspace, 1"
        "SUPER SHIFT, code:11, movetoworkspace, 2"
        "SUPER SHIFT, code:12, movetoworkspace, 3"
        "SUPER SHIFT, code:13, movetoworkspace, 4"
        "SUPER SHIFT, code:14, movetoworkspace, 5"
        "SUPER SHIFT, code:15, movetoworkspace, 6"
        "SUPER SHIFT, code:16, movetoworkspace, 7"
        "SUPER SHIFT, code:17, movetoworkspace, 8"
        "SUPER SHIFT, code:18, movetoworkspace, 9"
        "SUPER SHIFT, code:19, movetoworkspace, 10"

        # Move active window silently to workspace
        "SUPER SHIFT ALT, code:10, movetoworkspacesilent, 1"
        "SUPER SHIFT ALT, code:11, movetoworkspacesilent, 2"
        "SUPER SHIFT ALT, code:12, movetoworkspacesilent, 3"
        "SUPER SHIFT ALT, code:13, movetoworkspacesilent, 4"
        "SUPER SHIFT ALT, code:14, movetoworkspacesilent, 5"
        "SUPER SHIFT ALT, code:15, movetoworkspacesilent, 6"
        "SUPER SHIFT ALT, code:16, movetoworkspacesilent, 7"
        "SUPER SHIFT ALT, code:17, movetoworkspacesilent, 8"
        "SUPER SHIFT ALT, code:18, movetoworkspacesilent, 9"
        "SUPER SHIFT ALT, code:19, movetoworkspacesilent, 10"

        # Close window
        "SUPER, W, killactive"
      ];
      bindel = [
        # Volume
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        ",XF86AudioMute,exec,pamixer -t"

        # Brightness
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ];
    };
  };
}
