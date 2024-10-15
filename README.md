# Basic ROS Setup

This repo contains a basic ros shell setup utilizing [lopsided98:nix-ros-overlay](https://github.com/lopsided98/nix-ros-overlay)


## Learning Goals

- Install nix & enable flakes on your machine

- Enter a nix defined shell

## Install nix and enable flakes

- [Install Nix](https://nixos.org/download.html)
- [Enable Flakes](https://wiki.nixos.org/wiki/Flakes)
- (Optional) [configure Nix to use ROS Cachix binary cache](https://github.com/lopsided98/nix-ros-overlay#configure-binary-cache)
- Try one of the [examples](https://github.com/lopsided98/nix-ros-overlay#examples)

## Hints

You can make yourself a trusted user to enable binary cache usage

You can accept the usage of a binary cache but also the machines configuration must allow you to utilize a binary cache in `/etc/nix/nix.cof`:

``` nix
experimental-features = nix-command flakes
build-users-group = nixbld
trusted-users = <user-id>
```

## Commands

```bash
# Install in Ubuntu
sh <(curl -L https://nixos.org/nix/install) --daemon
# Change nix.conf for flakes and trusted user
nvim /etc/nix/nix.conf
# Clone the repo
mkdir ~/mag-nix && cd ~/mag-nix
git clone https://github.com/mag-nix/ros-basic.git
cd ros-basic
# Enter nix develop shell (maybe in tmux)
nix develop
# Use ros e.g. start the roscore
roscore
# Open a second terminal
nix develop
rosrun rospy_tutorials talker
# Open a third terminal
nix develop
rosrun rospy_tutorials listener
```
