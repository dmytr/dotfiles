source $HOME/.nix-profile/etc/profile.d/nix.sh

export NIX_PATH="$NIX_PATH":"local=$HOME/.local/nixpkgs"

NIX_XDG_DATA_DIRS=$HOME/.nix-profile/share
if [ -z "$XDG_DATA_DIRS" ]; then
    export XDG_DATA_DIRS="$NIX_XDG_DATA_DIRS"
else
    export XDG_DATA_DIRS="$NIX_XDG_DATA_DIRS":"$XDG_DATA_DIRS"
fi

NIX_LD_LIBRARY_PATH=/run/opengl-driver/lib
if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH"
else
    export LD_LIBRARY_PATH="$NIX_LD_LIBRARY_PATH":"$LD_LIBRARY_PATH"
fi

