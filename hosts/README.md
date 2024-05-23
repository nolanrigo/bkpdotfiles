# Hosts config

| Name        | Description                     |
| ----------- | ------------------------------- |
| `nuc-nixos` | NUC 11 Enthusiast, main machine |

All the hosts have a shared config in `modules/core.nix`. Host specific configs
are stored inside the specific host dir. Each host imports its own modules
inside `default.nix`.
