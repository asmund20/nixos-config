{
  config,
  pkgs,
  ...
}:
let
  wallpaper = pkgs.fetchurl {
    url = "https://cdn.wallpapersafari.com/10/81/0VQDfp.jpg";
    sha256 = "sha256-hpY2miVwRcBfNlpEoP6NsmpOJaiwB01AXmyPTISjN8A=";
  };
in
{
  home.file."${config.xdg.dataHome}/wallpapers/main.jpg".source = wallpaper;

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${config.xdg.dataHome}/wallpapers/main.jpg" ];
      wallpaper = [
        {
          monitor = "";
          fit_mode = "cover";
          path = "${config.xdg.dataHome}/wallpapers/main.jpg";
        }
      ];
      splash = false;
    };
  };

}
