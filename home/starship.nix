{ lib, ... }: {
  programs.starship = {
    enable = true;

    settings = {
      format = lib.concatStrings [
        "$nix_shell"
        "$python"
        "$directory"
        "$git_branch"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$status"
        "$character"
      ];

      directory = {
        truncation_length = 0;
        style = "bold sky";
      };

      nix_shell = {
        format = "[$symbol]($style)";
        symbol = "󱄅 ";
      };

      python = {
        format = "[(\\($virtualenv\\) )]($style)";
        style = "bold yellow";
      };

      git_branch = {
        style = "bold mauve";
      };

      cmd_duration = {
        style = "bold maroon";
      };
    };
  };
}
