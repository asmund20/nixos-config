{ pkgs, ... }:
{
  home.packages = with pkgs; [ fourmolu ];
  home.file = {
    ".config/fourmolu.yaml" = {
      text = ''
        column-limit:  80
      '';
    };
  };
}
