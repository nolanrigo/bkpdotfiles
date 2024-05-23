{
  networking = {
    hostName = "nuc-nixos";
    nameservers = [
      "208.67.222.222"
      "208.67.220.220"
    ];
  };
  services.connman.enable = true;
}
