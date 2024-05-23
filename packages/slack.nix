{pkgs, ...}: {
  home-manager.users.nolan = {
    home.packages = with pkgs; [
      slack
      slack-term
    ];
  };
}
