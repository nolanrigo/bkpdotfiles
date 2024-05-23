{pkgs, ...}: let
  mod = "Mod4";
in {
  programs = {
    sway.enable = true;
    xwayland.enable = true;
  };

  security.polkit.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "sway";
        user = "nolan";
      };
      default_session = initial_session;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  home-manager.users.nolan = {
    home = {
      packages = with pkgs; [
        zip
        unzip
      ];
      sessionVariables = {
        XDG_CURRENT_DESKTOP = "sway";
        WLR_NO_HARDWARE_CURSORS = "1"; # If your cursor becomes invisible
        NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
      };
      pointerCursor = {
        name = "Dracula-cursors";
        package = pkgs.dracula-theme;
        size = 16;
        gtk.enable = true;
      };
    };

    services = {
      flameshot = {
        enable = true;
      };
    };

    wayland.windowManager.sway = {
      enable = true;
      xwayland = true;
      wrapperFeatures.gtk = true;
      config = {
        terminal = "kitty";
        startup = [];

        modifier = mod;
        defaultWorkspace = "f";
        workspaceAutoBackAndForth = false;
        workspaceLayout = "default";
        colors = {
          background = "#f8f8f2";
          focused = {
            background = "#6272a4";
            border = "#6272a4";
            childBorder = "#6272a4";
            indicator = "#6272a4";
            text = "#f8f8f2";
          };
          focusedInactive = {
            border = "#44475a";
            background = "#44475a";
            text = "#f8f8f2";
            indicator = "#44475a";
            childBorder = "#44475a";
          };
          placeholder = {
            border = "#282a36";
            background = "#282a36";
            text = "#f8f8f2";
            indicator = "#282a36";
            childBorder = "#282a36";
          };
          unfocused = {
            border = "#282a36";
            background = "#282a36";
            text = "#bfbfbf";
            indicator = "#282a36";
            childBorder = "#282a36";
          };
          urgent = {
            border = "#44475a";
            background = "#ff5555";
            text = "#f8f8f2";
            indicator = "#ff5555";
            childBorder = "#ff5555";
          };
        };
        window = {
          hideEdgeBorders = "none"; # "none", "vertical", "horizontal", "both", "smart"
          titlebar = false;
          border = 3;
          commands = [
            # workaround for https://github.com/i3/i3/issues/5149
            /*
            {
              # criteria = { class = "XTerm"; };
              criteria = { all = true; };
              command = "border pixel 3";
            }
            */
          ];
        };
        floating = {
          titlebar = false;
          border = 3;
          criteria = [
            {window_role = "pop-up";}
            {class = "Pavucontrol";}
            {class = ".blueman-manager-wrapped";}
          ];
        };
        focus = {
          followMouse = false;
          newWindow = "smart";
          forceWrapping = false;
          mouseWarping = true;
        };
        fonts = {
          names = ["Ubuntu"];
          style = "Medium";
          size = 10.0;
        };
        keybindings = let
          exec = path: "exec --no-startup-id \"${path}\"";
          workspaces = ws:
            builtins.listToAttrs (builtins.concatLists (builtins.map (w: [
                {
                  name = "${mod}+${w}";
                  value = "workspace ${w}";
                }
                {
                  name = "${mod}+Shift+${w}";
                  value = "move container to workspace ${w}";
                }
              ])
              ws));
        in
          workspaces [
            "q"
            "w"
            "e"
            "r"
            "a"
            "s"
            "d"
            "f"
            "z"
            "x"
            "c"
            "v"
            "1"
            "2"
            "3"
            "4"
            "5"
          ]
          // {
            # Kill
            "${mod}+p" = "kill";

            # Navigation
            "${mod}+h" = "focus left"; # exec "${pkgs.i3-cycle-focus}/bin/i3-cycle-focus reverse";
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+l" = "focus right"; # exec "${pkgs.i3-cycle-focus}/bin/i3-cycle-focus cycle";

            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+l" = "move right";

            # Output
            "${mod}+t" = "move workspace to output left";
            "${mod}+y" = "move workspace to output right";

            # Layout
            "${mod}+m" = "layout tabbed";
            "${mod}+comma" = "layout stacking";
            "${mod}+period" = "layout toggle split";

            # Split
            "${mod}+b" = "split h";
            "${mod}+n" = "split v";

            # Fullscreen
            "${mod}+u" = "fullscreen toggle";
            "${mod}+i" = "focus parent";
            "${mod}+o" = "focus child";

            # Floating
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle";

            # Media
            "XF86AudioRaiseVolume" = exec "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
            "XF86AudioLowerVolume" = exec "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
            "XF86AudioMute" = exec "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86AudioMicMute" = exec "${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            "XF86AudioPlay" = exec "${pkgs.playerctl}/bin/playerctl play-pause";
            "XF86AudioPause" = exec "${pkgs.playerctl}/bin/playerctl play-pause";
            "XF86AudioNext" = exec "${pkgs.playerctl}/bin/playerctl next";
            "XF86AudioPrev" = exec "${pkgs.playerctl}/bin/playerctl previous";
            "XF86ScreenSaver" = exec "${pkgs.swaylock}/bin/swaylock -c 000000";
            "Print" = exec "flameshot gui";

            # Programs
            "${mod}+Return" = exec "kitty";
            "${mod}+slash" = exec "firefox"; # exec "qutebrowser";
            "${mod}+Shift+slash" = exec "firefox --private-window"; # exec "qutebrowser --target private-window";
            "${mod}+Shift+period" = exec "rofi -modi calc -show calc";
            "${mod}+apostrophe" = exec "rofi -modi drun -show drun -show-icons";
            "${mod}+Shift+apostrophe" = exec "rofi -modi emoji -show emoji -emoji-mode copy";

            # Mode
            "${mod}+g" = "mode 类";
          };
        modes = {
          "类" = rec {
            h = "resize shrink width 10 px or 10 ppt";
            "${mod}+h" = h;

            j = "resize grow height 10 px or 10 ppt";
            "${mod}+j" = j;

            k = "resize shrink height 10 px or 10 ppt";
            "${mod}+k" = k;

            l = "resize grow width 10 px or 10 ppt";
            "${mod}+l" = l;

            Escape = "mode default";
          };
        };
      };
    };
  };
}
