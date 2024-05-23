{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # INFO: Show battery charge level
      };
    };
  };

  services.blueman.enable = true;
}
