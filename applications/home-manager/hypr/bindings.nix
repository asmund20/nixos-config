{ lib }:

let
  mklua = lib.generators.mkLuaInline;
  mkLua = lib.generators.mkLuaInline;

  directions = {
    left  = "h";
    right = "l";
    up    = "k";
    down  = "j";
  };

  # generate directional bindings: focus, move window, move workspace (monitor)
  bindingsFromDirections = concatLists (
    [
      # for stable order iterate attrNames
      for d in builtins.attrNames directions:
        let k = builtins.getAttr d directions; in
        [
          {
            _args = [
              (mklua ("mod .. \" + " + k + "\""))
              (mkLua ("hl.dsp.focus({direction = \"" + d + "\"})"))
            ];
          }
          {
            _args = [
              (mklua ("mod .. \" + SHIFT + " + k + "\""))
              (mkLua ("hl.dsp.window.move({direction = \"" + d + "\"})"))
            ];
          }
          {
            _args = [
              (mklua ("mod .. \" + SHIFT + ALT + " + k + "\""))
              (mkLua ("hl.dsp.workspace.move({monitor = \"" + d + "\"})"))
            ];
          }
        ]
    ]
  );

  # Workspaces 1..N
  workspaceCount = 10;
  workspaceNumbers = builtins.genList (i: i + 1) workspaceCount;  # [1 2 ... N]

  workspaceBindings = lib.concatMap (n:
    [
      {
        _args = [
          (mklua ("mod .. \" + " + toString n + "\""))
          (mkLua ("hl.dsp.workspace.focus(" + toString n + ")"))
        ];
      }
      {
        _args = [
          (mklua ("mod .. \" + SHIFT + " + toString n + "\""))
          (mkLua ("hl.dsp.window.move({workspace = " + toString n + "})"))
        ];
      }
      {
        _args = [
          (mklua ("mod .. \" + SHIFT + ALT + " + toString n + "\""))
          (mkLua ("hl.dsp.window.move({workspace = " + toString n + "}, {follow=false})"))
        ];
      }
    ]
  ) workspaceNumbers;

  # static bindings you had (fixed typos and use mkLua consistently)
  staticBindings = [
    {
      _args = [
        (mklua "mod .. \" + W\"")
        (mkLua "hl.dsp.window.close()")
        { locked = true; }
      ];
    }

    {
      _args = [
        (mklua "mod .. \" + T\"")
        (mkLua "hl.dsp.exec_cmd(\"ghostty\")")
      ];
    }

    {
      _args = [
        (mklua "mod .. \" + B\"")
        (mkLua "hl.dsp.exec_cmd(\"zen\")")
      ];
    }

    {
      _args = [
        (mklua "mod .. \" + SPACE\"")
        (mkLua "hl.dsp.exec_cmd(\"hyprlauncher\")")
      ];
    }

    {
      _args = [
        (mklua "mod .. \" + C\"")
        (mkLua "hl.dsp.exec_cmd(\"hyprlock\")")
      ];
    }

    # Resize window (explicit individual entries)
    {
      _args = [
        (mklua "mod .. \" + ALT + h\"")
        (mkLua "hl.dsp.window.resize({x = -25, y = 0, relative=true})")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mklua "mod .. \" + ALT + j\"")
        (mkLua "hl.dsp.window.resize({x = 0, y = 25, relative=true})")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mklua "mod .. \" + ALT + k\"")
        (mkLua "hl.dsp.window.resize({x = 0, y = -25, relative=true})")
        { repeating = true; }
      ];
    }
    {
      _args = [
        (mklua "mod .. \" + ALT + l\"")
        (mkLua "hl.dsp.window.resize({x = 25, y = 0, relative=true})")
        { repeating = true; }
      ];
    }
  ];

  # convert previous bindel (exec strings) into bind entries that exec and repeat
  volAndBrgtBindings = [
    # volume
    {
      _args = [
        ",XF86AudioRaiseVolume"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume +\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        ",XF86AudioLowerVolume"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume -\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        ",XF86AudioMute"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume m\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        "SUPER + U"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume +\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        "SUPER + D"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume -\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        "SUPER + M"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt volume m\")")
        { repeating = true; }
      ];
    }

    # brightness
    {
      _args = [
        ",XF86MonBrightnessUp"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt brightness +\")")
        { repeating = true; }
      ];
    }
    {
      _args = [
        ",XF86MonBrightnessDown"
        (mkLua "hl.dsp.exec_cmd(\"vol_and_brgt brightness -\")")
        { repeating = true; }
      ];
    }
  ];

in
{
  wayland.windowManager.hyprland = {
    settings = {
      mod = {
        _var = "SUPER";
      };

      bind = concatLists [
        staticBindings
        bindingsFromDirections
        workspaceBindings
        volAndBrgtBindings
      ];
    };
  };
}
