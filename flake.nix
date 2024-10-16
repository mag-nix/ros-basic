{
  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs"; # Usage of different nixpkgs for fixes and adaptions
  };
  outputs = { self, nix-ros-overlay, nixpkgs }:
    # All Systems https://github.com/NixOS/nixpkgs/blob/master/lib/systems/default.nix
    # Default Systems ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"]
    nix-ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nix-ros-overlay.overlays.default ];
        };
      in {
        devShells.default = pkgs.mkShell {
          name = "Example project";
          packages = [
            (with pkgs.rosPackages.noetic; buildEnv {
                paths = [
                    # Core ROS Packages
                    # ros-core
                    roslaunch
                    rosbash
                    rospy-tutorials
                    # roscpp-tutorials
                ];
            })
          ];

          ROS_HOSTNAME = "localhost";
          ROS_MASTER_URI = "http://localhost:11311";

          shellHook = ''
            # enable auto completion
            source ${pkgs.rosPackages.noetic.rosbash}/share/rosbash/rosbash
            # convenient aliases
            alias talker='rosrun rospy_tutorials talker'
            alias listener='rosrun rospy_tutorials listener'
          '';
        };
      });
  nixConfig = {
    extra-substituters = [
      "https://ros.cachix.org"
      "https://magnix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo="
      "magnix.cachix.org-1:S2LwuWtB3Di2YlymYH8avFhVdiNNWD42uV3eH3VYeGI="
    ];
  };
}
