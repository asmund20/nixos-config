{ lib, ... }:
let 
  mkLua = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        _args = [
	  mkLua "output = \"\""
	  mkLua "mode = \"preferred\""
	  mkLua "position = \"auto\""
	  mkLua "scale = 1"
        ];
      }
      {
        _args = [
	  mkLua "output = \"eDP-1\""
	  mkLua "mode = \"preferred\""
	  mkLua "position = \"auto-down\""
	  mkLua "scale = 1"
        ];
      }
      {
        _args = [
	  mkLua "output = \"HDMI-A-1\""
	  mkLua "mode = \"preferred\""
	  mkLua "position = \"auto-up\""
	  mkLua "scale = 1"
        ];
      }
      {
        _args = [
	  mkLua "output = \"desc:ASUSTek COMPUTER INC ASUS VG249 0x000375FB\""
	  mkLua "mode = \"1920x1080\""
	  mkLua "position = \"1440x800\""
	  mkLua "scale = 1"
        ];
      }
      {
        _args = [
	  mkLua "output = \"desc:Dell Inc. DELL U2717D J0XYN95AA06L\""
	  mkLua "mode = \"2560x1440\""
	  mkLua "position = \"0x0\""
	  mkLua "scale = 1"
	  mkLua "transform = 1"
        ];
      }
    ];
  };
}
