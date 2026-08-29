{ lib, ... }:

let
  mkLua = lib.generators.mkLuaInline;

in
{
  wayland.windowManager.hyprland = {
    bind = [
      {
        _args = [
          "SUPER + T"
          (mkLua "hl.dsp.exec_cmd(\"ghostty\")")
        ];
      };
    ];
  };
}
