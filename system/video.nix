{...}: {
  hardware = {
    nvidia.modesetting.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
