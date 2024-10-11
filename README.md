# Basic ROS Setup

This repo contains a basic ros shell setup utilizing [lopsided98:nix-ros-overlay](https://github.com/lopsided98/nix-ros-overlay)

## How to use

### Install nix and enable flakes

- [Install Nix](https://nixos.org/download.html)
- [Enable Flakes](https://wiki.nixos.org/wiki/Flakes)
- (Optional) [configure Nix to use ROS Cachix binary cache](https://github.com/lopsided98/nix-ros-overlay#configure-binary-cache)
- Try one of the [examples](https://github.com/lopsided98/nix-ros-overlay#examples)

### Enter nix shell

``` bash
nix develop
```
