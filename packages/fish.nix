{pkgs, ...}: {
  users.users.nolan = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true; # because fish is installed via home-manager
  };

  home-manager.users.nolan = {
    home.packages = with pkgs; [
      ripgrep # rg
      fd
      just
      bottom # btm
      sd
      procs
      wl-clipboard
    ];

    programs = {
      bat.enable = true;
      jq.enable = true;
      eza = {
        enable = true;
        enableAliases = true;
        git = true;
        icons = true;
        extraOptions = [
          "-al"
          "--group-directories-first"
        ];
      };
      tealdeer = {
        enable = true;
        settings = {
          display = {
            compact = false;
            use_pager = false;
          };
          updates = {
            autoUpdate = true;
          };
        };
      };
      dircolors = {
        enable = true;
        enableFishIntegration = true;
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
        # enableFishIntegration = true;
      };
      mcfly = {
        enable = true;
        enableFishIntegration = true;
      };
      pazi = {
        enable = true;
        enableFishIntegration = true;
      };

      fish = {
        enable = true;

        loginShellInit = "";
        shellInit = ''
          fish_vi_key_bindings
        '';
        interactiveShellInit = ''
          set fish_greeting
        '';

        plugins = [];

        shellAbbrs = rec {
          nrs = "sudo nixos-rebuild switch";
          # nrs = "sudo nixos-rebuild switch --impure --flake ~/projects/nolanrigo/nixos";
          # ncu = "sudo nix-channel --update";
          rf = "rm -rf";
          nip = "nix-shell -p";
          ls = "eza";
          l = ls;
          cat = "bat";
          find = "fd --hidden";
          ps = "procs";
          psgrep = "procs -ax | rg";
          sed = "sd";
          grep = "rg";
          rgf = "rg -F";
          rgfl = "rg --files-with-matches -F";
          t = "date";
          tu = "date -u";
          top = "btm";
          htop = top;
          j = "just";

          copy = "wl-copy";
          paste = "wl-paste";

          npkill = "nix-shell -p nodejs --run \"npx npkill\"";

          # npm
          ni = "npm i";
          nci = "npm ci";
          nid = "npm i -D";
          nun = "npm un";
          ncu = "npx npm-check-updates -i";

          # Yarn
          y = "yarn";
          ya = "yarn add";
          yad = "yarn add --dev";
          yr = "yarn remove";
          ycu = "yarn upgrade-interactive --latest";
        };

        functions = {
          gitignore = "curl -sL https://www.gitignore.io/api/$argv";
          nixify = let
            shellDotNix = ''
              with import <nixpkgs> {};
              stdenv.mkDerivation {
                name = \"env\";
                buildInputs = [
                ];
                ENV_VARIABLE = \"VALUE\";
              }
            '';
          in ''
            if test ! -e ./.envrc
              echo "use nix" > ./.envrc
              direnv allow
            end
            if test ! -e ./shell.nix
              echo "${shellDotNix}" > ./shell.nix
              $EDITOR ./shell.nix
            end
          '';
        };
      };

      starship = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          add_newline = true;
          line_break.truncate_to_repo = true;
          gcloud.disabled = true;
          time.disabled = false;

          aws.style = "bold #ffb86c";
          cmd_duration.style = "bold #f1fa8c";
          directory.style = "bold #50fa7b";
          hostname.style = "bold #ff5555";
          git_branch.style = "bold #ff79c6";
          git_status.style = "bold #ff5555";

          username = {
            format = "[$user]($style) on ";
            style_user = "bold #bd93f9";
          };

          character = {
            success_symbol = "[λ](bold #f8f8f2)";
            error_symbol = "[λ](bold #ff5555)";
          };
        };
      };
    };
  };
}
