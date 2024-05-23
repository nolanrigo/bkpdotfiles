{modulesPath, pkgs, ...}: {
  system.stateVersion = "23.11";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    <home-manager/nixos>

    ./system/kernel.nix
    ./system/file-systems.nix
    ./system/bootloader.nix
    ./system/nixpkgs.nix
    ./system/nur.nix
    ./system/sudo.nix
    ./system/home-manager.nix
    ./system/networking.nix
    ./system/printing.nix
    ./system/i18n.nix
    ./system/video.nix
    ./system/audio.nix
    ./system/time.nix
    ./system/user.nix
    ./system/common.nix
    ./system/bluetooth.nix
    ./system/xdg.nix
    ./system/fonts.nix
    ./system/disk-auto-mount.nix

    ./display-manager/sway.nix

    ./packages/kitty.nix
    ./packages/fish.nix
    ./packages/neovim/neovim.nix
    ./packages/vscode.nix
    ./packages/git.nix
    ./packages/firefox.nix
    ./packages/docker.nix
    ./packages/slack.nix
    ./packages/rofi.nix
    ./packages/spotify.nix
    ./packages/discord.nix
  ];

  home-manager.users.nolan.home.packages = with pkgs; [
    libreoffice
    pavucontrol
    insomnia
    _1password-gui
    ranger
    tmatrix
    sl
    yq
    wlr-randr
    obs-studio
    vlc
    qutebrowser
    dbeaver
    google-chrome
    jetbrains.idea-ultimate
  ];
}
