{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        # Open stuff
        "SUPER, T, exec, ghostty"
        "SUPER, B, exec, zen"
        "SUPER, SPACE, exec, rofi -show drun -show-icons"

        # Hyprlock
        "SUPER, C, exec, hyprlock"

        # Move focus and windows
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        # Move workspace to other monitor
        "SUPER SHIFT ALT, H, movecurrentworkspacetomonitor, l"
        "SUPER SHIFT ALT, L, movecurrentworkspacetomonitor, r"
        "SUPER SHIFT ALT, K, movecurrentworkspacetomonitor, u"
        "SUPER SHIFT ALT, J, movecurrentworkspacetomonitor, d"

        # Switch window with the one next to it
        "SUPER SHIFT, H, swapwindow, l"
        "SUPER SHIFT, L, swapwindow, r"
        "SUPER SHIFT, K, swapwindow, u"
        "SUPER SHIFT, J, swapwindow, d"

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
        ",XF86AudioRaiseVolume,exec,vol_and_brgt volume +"
        ",XF86AudioLowerVolume,exec,vol_and_brgt volume -"
        ",XF86AudioMute,exec,vol_and_brgt volume m"
        "SUPER,U,exec,vol_and_brgt volume +"
        "SUPER,D,exec,vol_and_brgt volume -"
        "SUPER,M,exec,vol_and_brgt volume m"

        # Brightness
        ",XF86MonBrightnessUp,exec,vol_and_brgt brightness +"
        ",XF86MonBrightnessDown,exec,vol_and_brgt brightness -"
      ];
    };
  };
}
