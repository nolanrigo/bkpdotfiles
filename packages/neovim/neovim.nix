{
  pkgs,
  lib,
  ...
}: {
  home-manager.users.nolan.programs = {
    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;

      extraLuaConfig = lib.readFile ./config.lua;
    };
    fish.shellAbbrs = {
      e = "nvim";
    };
  };
}
