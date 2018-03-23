source $HOME/.nix-profile/etc/profile.d/nix.sh

export NIX_PATH="$NIX_PATH":"local=$HOME/.local/nixpkgs"

NIX_XDG_DATA_DIRS=$HOME/.nix-profile/share
if [ -z "$XDG_DATA_DIRS" ]; then
    export XDG_DATA_DIRS="$NIX_XDG_DATA_DIRS"
else
    export XDG_DATA_DIRS="$NIX_XDG_DATA_DIRS":"$XDG_DATA_DIRS"
fi

NIX_LIBGL_DRIVERS_PATH=/nix/store/1yawik475cqd2d0pczg11q69bc2x097f-mesa-noglu-17.3.3-drivers/lib/dri
if [ -z "$LIBGL_DRIVERS_PATH" ]; then
    export LIBGL_DRIVERS_PATH="$NIX_LIBGL_DRIVERS_PATH"
else
    export LIBGL_DRIVERS_PATH="$NIX_LIBGL_DRIVERS_PATH":"$LIBGL_DRIVERS_PATH"
fi

