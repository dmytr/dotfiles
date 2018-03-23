source $HOME/.nix-profile/etc/profile.d/nix.sh

export NIX_PATH="$NIX_PATH":"local=$HOME/.local/nixpkgs"

export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS

export LIBGL_DRIVERS_PATH=/nix/store/1yawik475cqd2d0pczg11q69bc2x097f-mesa-noglu-17.3.3-drivers/lib/dri
