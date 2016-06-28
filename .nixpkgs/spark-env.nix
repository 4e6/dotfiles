with import <nixpkgs> {};
let dependencies = rec {
  _oraclejdk8 = pkgs.stdenv.lib.overrideDerivation pkgs.oraclejdk8 (attrs : {
    installPhase = ''
      ${attrs.installPhase}

      # split bundled ca-certificates into separate files 'cert.N.pem'
      # and add them to default keystore
      keytool=$out/bin/keytool
      keystore=$jrePath/lib/security/cacerts
      pems_dir=pems
      mkdir "$pems_dir"
      pushd "$pems_dir"
      awk 'BEGIN {c=0;doPrint=0;} /END CERT/ {print > "cert." c ".pem";doPrint=0;} /BEGIN CERT/{c++;doPrint=1;} { if(doPrint == 1) {print > "cert." c ".pem"} }' < /etc/ssl/certs/ca-bundle.crt
      # import certificates
      for f in `ls cert.*.pem`; do
        alias=`basename $f`
        $keytool -import -trustcacerts -noprompt -keystore "$keystore" -alias "$alias" -file "$f" -storepass changeit;
      done
      popd
    '';
  });

  _maven3_3_9 = pkgs.lib.makeOverridable (args: pkgs.lib.overrideDerivation (pkgs.maven3.override args) (attrs : rec {
    version = "3.3.9";

    name = "apache-maven-${version}";

    src = pkgs.fetchurl {
      url = "mirror://apache/maven/maven-3/${version}/binaries/${name}-bin.tar.gz";
      sha256 = "6e3e9c949ab4695a204f74038717aa7b2689b1be94875899ac1b3fe42800ff82";
    };

  })) { };

  _maven = _maven3_3_9.override {
    jdk = _oraclejdk8;
  };

  _sbt = pkgs.sbt.override {
    jre = _oraclejdk8;
  };
};
in with dependencies;
stdenv.mkDerivation rec {
  name = "spark-env";

  buildInputs = [
    _oraclejdk8
    _maven
    _sbt
  ];

  shellHook = ''
    export MAVEN_OPTS="-Xmx8g -XX:ReservedCodeCacheSize=512m"
    export SBT_OPTS=$MAVEN_OPTS
  '';
}
