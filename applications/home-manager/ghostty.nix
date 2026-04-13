{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "nu";
      cursor-style = "block";
      cursor-invert-fg-bg = true;
      background-opacity = 0.91;
      theme = "Catppuccin Macchiato";

      copy-on-select = "clipboard";

      keybind = [
        "ctrl+s>r=reload_config"
        # split
        "ctrl+s>|=new_split:right"
        "ctrl+s>-=new_split:down"

        "ctrl+s>j=goto_split:down"
        "ctrl+s>k=goto_split:up"
        "ctrl+s>h=goto_split:left"
        "ctrl+s>l=goto_split:right"

        "ctrl+s>up=resize_split:up,10"
        "ctrl+s>down=resize_split:down,10"
        "ctrl+s>left=resize_split:left,10"
        "ctrl+s>right=resize_split:right,10"

        "ctrl+s>e=equalize_splits"
      ];
    };
  };
}
