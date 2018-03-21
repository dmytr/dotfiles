{ maven, fetchurl }:

let 
  version = "3.0.5";
in
maven.overrideAttrs (attrs: rec {
  name = "apache-maven-${version}";

  src = fetchurl {
    url = "mirror://apache/maven/maven-3/${version}/binaries/${name}-bin.tar.gz";
    sha256 = "d98d766be9254222920c1d541efd466ae6502b82a39166c90d65ffd7ea357dd9";
  };
})

