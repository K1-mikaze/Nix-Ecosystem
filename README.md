# Nix-Ecosystem


## NixOS with Flakes

To update a the configuration without having touch the flake.nix file 

```nix
sudo nixos-rebuild switch --flake .#host
```
If you have touch the flake.nix file

```nix
sudo nix flake update
sudo nixos-rebuild switch --flake .#host
```

## VM

To enable Virtual manager use `sudo virsh net-start default` 

# Nix-Ecosystem
