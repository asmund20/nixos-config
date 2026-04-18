{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Åsmund Olai Sand-Larsen";
        email = "asmund.sl@proton.me";
      };
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
