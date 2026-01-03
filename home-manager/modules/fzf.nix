{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      # light gray base, blue highlights, red prompt, green marker, purple spinner.
      fg = "#DEDDDA";
      hl = "#3584E4";
      "fg+" = "#FFFFFF";
      "hl+" = "#62A0EA";
      info = "#9A9996";
      prompt = "#C01C28";
      pointer = "#3584E4";
      marker = "#26A269";
      spinner = "#9141AC";
      header = "#77767B";
    };
  };
}
