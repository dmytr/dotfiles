self: super:

{
  maven_3_0_5 = super.callPackage ./pkgs/development/tools/build-managers/apache-maven/3.0.5.nix {
    inherit (self) maven fetchurl; };  
}

