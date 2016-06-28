# environment for Apache Hadoop development

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

  _maven = pkgs.maven.override {
    jdk = _oraclejdk8;
  };
};
in with dependencies;
stdenv.mkDerivation rec {
  name = "hadoop-env";

  buildInputs = [
    # build with native libs
    pkgs.fuse
    pkgs.pkgconfig
    pkgs.protobuf2_5
    pkgs.zlib

    _oraclejdk8
    _maven
  ];
}
