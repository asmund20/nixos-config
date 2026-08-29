{ lib, ... }:

let
  mkLua = lib.generators.mkLuaInline;
  mod = a: b: a - (b * (a / b));
  directions = {
    left = "h";
    right = "l";
    up = "k";
    down = "j";
  };
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
    ];

in
{
  wayland.windowManager.hyprland.settings = {
    mod = {
      _var = "SUPER";
    };
    bind = lib.concatLists [
      staticBinds
    ];
  };
}
