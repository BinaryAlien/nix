{ ... }: {
  programs.git = {
    enable = true;

    difftastic.enable = true;
    lfs.enable = true;

    userEmail = "49949198+BinaryAlien@users.noreply.github.com";
    userName = "Binary";

    extraConfig = {
      commit = {
        verbose = true;
      };

      pull = {
        rebase = true;
      };
    };

    aliases = {
      a = "add";
      b = "branch";
      c = "commit";
      cf = "commit --amend --no-edit";
      co = "checkout";
      cp = "cherry-pick";
      cs = "commit --amend";
      d = "diff";
      ds = "diff --staged";
      f = "fetch";
      l = "log --oneline -15";
      la = "log --oneline --all --graph";
      m = "merge";
      mt = "mergetool";
      pf = "push --force-with-lease";
      pl = "pull";
      ps = "push";
      rb = "rebase";
      rs = "reset";
      rt = "restore";
      rv = "revert";
      s = "status -s";
      sm = "submodule";
      st = "stash";
      t = "tag";
    };
  };
}
