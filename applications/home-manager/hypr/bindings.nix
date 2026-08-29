{ lib, ... }:

let
  mkLua = lib.generators.mkLuaInline;
  mod = a: b: a - (b * (a / b));
  directions = [
    [ "left" "h"]
    [ "right" "l"]
    [ "up" "k"]
    [ "down" "j"]
  ];

  bindingsFromDirections = lib.concatMap (pair:
    let
      direction = lib.elemAt pair 0;
      key = lib.elemAt pair 1;
    in
    [
      {
        _args = [
          (mkLua ("mod .. \" + " + key + "\""))
          (mkLua ("hl.dsp.focus({direction = \"" + direction + "\"})"))
        ];
      }
      {
        _args = [
          (mkLua ("mod .. \" + SHIFT + " + key + "\""))
          (mkLua ("hl.dsp.window.move({direction = \"" + direction + "\"})"))
        ];
      }
      {
        _args = [
          (mkLua ("mod .. \" + SHIFT + ALT + " + key + "\""))
          (mkLua ("hl.dsp.workspace.move({monitor = \"" + direction + "\"})"))
        ];
      }
    ]
  ) directions;

  staticBinds = [
      {
        _args = [
          (mkLua "mod .. \" + T\"")
          (mkLua "hl.dsp.exec_cmd(\"ghostty\")")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + space\"")
          (mkLua "hl.dsp.exec_cmd(\"hyprlauncher\")")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + C\"")
          (mkLua "hl.dsp.exec_cmd(\"hyprlock\")")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + B\"")
          (mkLua "hl.dsp.exec_cmd(\"zen\")")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + W\"")
          (mkLua "hl.dsp.window.close()")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + V\"")
          (mkLua "hl.dsp.window.float({ action = \"toggle\"})")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + ALT + h\"")
          (mkLua "hl.dsp.window.resize({ x = -25, y = 0, relative = true })")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + ALT + j\"")
          (mkLua "hl.dsp.window.resize({ x = 0, y = 25, relative = true })")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + ALT + k\"")
          (mkLua "hl.dsp.window.resize({ x = 0, y = -25, relative = true })")
        ];
      }
      {
        _args = [
          (mkLua "mod .. \" + ALT + l\"")
          (mkLua "hl.dsp.window.resize({ x = 25, y = 0, relative = true })")
        ];
      }
    ];

  workspaceNumbers = builtins.genList (i: i + 1) 10;
  workspaceBindings = lib.concatMap (n:
    [
      {
        _args = [
          (mkLua ("mod .. \" + " + toString (mod n 10) + "\""))
          (mkLua ("hl.dsp.focus({workspace = " + toString n + "})"))
        ];
      }
      {
        _args = [
          (mkLua ("mod .. \" + SHIFT + " + toString (mod n 10) + "\""))
          (mkLua ("hl.dsp.window.move({workspace = " + toString n + "})"))
        ];
      }
      {
        _args = [
          (mkLua ("mod .. \" + SHIFT + ALT + " + toString (mod n 10) + "\""))
          (mkLua ("hl.dsp.window.move({workspace = " + toString n + ", follow=false})"))
        ];
      }
    ]
  ) workspaceNumbers;

in
{
  wayland.windowManager.hyprland.settings = {
    mod = {
      _var = "SUPER";
    };
    bind = lib.concatLists [
      staticBinds
      workspaceBindings
      bindingsFromDirections
    ];
  };
}
