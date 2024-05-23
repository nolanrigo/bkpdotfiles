{pkgs, ...}: {
  home-manager.users.nolan = {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      nerdfonts
    ];
  };
}
