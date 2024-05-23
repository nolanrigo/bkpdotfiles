{pkgs, ...}: {
  home-manager.users.nolan = {
    programs.rofi = {
      enable = true;
      location = "top";
      yoffset = 100;
      terminal = "kitty";
      font = "Ubuntu 11";

      plugins = with pkgs; [
        rofi-calc
      ];
    };
  };
}
