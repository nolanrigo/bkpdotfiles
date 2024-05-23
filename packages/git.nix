{
  home-manager.users.nolan.programs = {
    git = {
      enable = true;
      userName = "Nolan Rigo";
      userEmail = "nolan@rigo.dev";

      ignores = [
        ".direnv/"
        "secrets.nix"
        ".ssh/id_rsa"
        ".ssh/id_rsa.pub"
      ];

      extraConfig = {
        github.user = "nolanrigo";

        init = {
          defaultBranch = "main";
        };

        alias = {
          lg = "log --graph --date=relative --pretty=tformat:'%Cred%h%Creset - %C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'";
        };

        core = {
          pager = "bat";
          editor = "nvim";
          autocrlf = "input";
          ignorecase = "false";
          whitespace = "trailing-space,space-before-tab";
        };

        apply = {
          whitespace = "fix";
        };

        status = {
          showUntrackedFiles = "all";
          submoduleSummary = "true";
        };

        diff = {
          wordRegex = ".";
          mnemonicPrefix = "true";
          renames = "true";
          submodule = "log";
        };

        color = {
          ui = "auto";
        };

        "color \"branch\"" = {
          upstream = "cyan";
        };

        log = {
          abbrevCommit = "true";
          follow = "true";
        };

        commit = {
          verbose = true;
        };

        grep = {
          extendedRegexp = "true";
        };

        fetch = {
          recurseSubmodules = "on-demand";
        };

        push = {
          default = "upstream";
          followTags = "true";
          autoSetupRemote = "true";
        };

        pull = {
          rebase = "merges";
        };

        rebase = {
          autosquash = "true";
        };

        tag = {
          sort = "version:refname";
        };

        merge = {
          log = "true";
          conflictStyle = "diff3";
        };

        rerere = {
          enabled = "true";
          autoupdate = "true";
        };
      };
    };

    fish.shellAbbrs = rec {
      gs = "git status -sb";
      gl = "git lg";
      gco = "git checkout";

      gmb = "git merge-base";
      gm = "git merge";

      ga = "git add";
      gap = "git add -p";
      gan = "git add -N";

      gcm = "git commit";
      gcmf = "git commit --fixup";
      gcma = "git commit --amend";
      gfm = "${gcm} --no-verify";
      gfmf = "${gcmf} --no-verify";
      gfma = "${gcma} --no-verify";

      grb = "git rebase";
      grbi = "git rebase -i";
      grbc = "git rebase --continue";
      grba = "git rebase --abort";

      gpl = "git pull";
      gpu = "git push";

      gpuu = "git push -u origin";
      gpuf = "git push --force";
      gpufl = "git push --force-with-lease";

      gss = "git stash save -u";
      gsp = "git stash pop --index";
      gsl = "git stash list";
      gsc = "git stash clear";

      gbr = "git branch -avv";
      gbrd = "git branch -d";
      gbrclean = "git fetch --prune; git branch -vv | rg ': gone]' | awk '{print $1}' | xargs -r git branch -d";

      gdf = "git diff";
      gdfs = "git diff --staged";

      gre = "git reset";
      greh = "git reset --hard";
      gres = "git reset --soft";
    };
  };
}
