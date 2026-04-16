{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      edit_mode = "vi";
    };
    environmentVariables = {
      PROMPT_COMMAND_RIGHT = "";
    };
    extraConfig = builtins.readFile ./git-completions.nu;

    shellAliases = {
      # Git stuff
      g = "git";
      gb = "git branch";
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gd = "git diff";
      gl = "git log";
      gph = "git push";
      gpl = "git pull";
      gs = "git status";
      gst = "git stash";

      e = "nvim";

      # NIXOS stuff
      nrs = "sudo nixos-rebuild switch --flake";
      nrt = "sudo nixos-rebuild test --flake";

      TODO = "grep -R 'TODO' .";
    };
  };
}
