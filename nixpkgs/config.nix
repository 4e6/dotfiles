{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    myLibtiff =
      let
        colorsPatch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-tiff2pdf-colors.patch?h=packages/libtiff";
          sha256 = "0v253l2fg79gq68awhsypbzypj0r4w041habi2adnfrq2mp49h8q";
          name = "tiff-4.0.3-tiff2pdf-colors.patch";
        };

        cve4447Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-3.9.7-CVE-2012-4447.patch?h=packages/libtiff";
          sha256 = "16a5ahrx4lmyh79292wvm0mghpxxhc4b73mdb5hkm53abyyql02g";
          name = "tiff-3.9.7-CVE-2012-4447.patch";
        };

        cve4564Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-3.9.7-CVE-2012-4564.patch?h=packages/libtiff";
          sha256 = "1wsi9np3vwd58plzsqnckbdvhifkxk03cq8dnlh9a8j845z6cpsj";
          name = "tiff-3.9.7-CVE-2012-4564.patch";
        };

        cve1960Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-CVE-2013-1960.patch?h=packages/libtiff";
          sha256 = "0nss7dj8s652xqia0ix40y20hbfqzrimw6rjymywvcb669ymg3k8";
          name = "tiff-4.0.3-CVE-2013-1960.patch";
        };

        cve1961Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-CVE-2013-1961.patch?h=packages/libtiff";
          sha256 = "1m1z3qn7cfh56rc42k325k84a0mq09vxp22jzx4d45k4hbs1q2ig";
          name = "tiff-4.0.3-CVE-2013-1961.patch";
        };

        libjpegTurboPatch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-libjpeg-turbo.patch?h=packages/libtiff";
          sha256 = "0h3p0f0m5qprx5svappyxfcvnl7080zxrly3kdl7vwzayn0fncgx";
          name = "tiff-4.0.3-libjpeg-turbo.patch";
        };

        cve4244Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/libtiff-CVE-2013-4244.patch?h=packages/libtiff";
          sha256 = "13afvmf2pwdddpkz9p8y7vklh2i3sjzw0fx28h489xvwhdx04lwa";
          name = "tiff-4.0.3-CVE-2013-4244.patch";
        };

        cve4231Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-CVE-2013-4231.patch?h=packages/libtiff";
          sha256 = "16i5s4zsx06xy2arbs9jq4phjkd8hnwdkg43snxywzjyhh76n1zm";
          name = "tiff-4.0.3-CVE-2013-4231.patch";
        };

        cve4232Patch = pkgs.fetchurl {
          url = "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/tiff-4.0.3-CVE-2013-4232.patch?h=packages/libtiff";
          sha256 = "0sfslkns8b7jn2n83fzxjvy637hpvsqr01jjijy4rpydvdap9297";
          name = "tiff-4.0.3-CVE-2013-4232.patch";
        };
      in
        pkgs.libtiff.overrideDerivation (attrs: {
          patchPhase = ''
            patch -p0 -i "${colorsPatch}"
            patch -p1 -i "${cve4447Patch}"
            patch -p1 -i "${cve4564Patch}"
            patch -p1 -i "${cve1960Patch}"
            patch -p1 -i "${cve1961Patch}"
            patch -p1 -i "${libjpegTurboPatch}"
            patch -p1 -i "${cve4244Patch}"
            (
            cd tools
            patch -p0 -i "${cve4231Patch}"
            patch -p0 -i "${cve4232Patch}"
            )
          '';
        });

    myLibopus = pkgs.libopus.overrideDerivation (attrs: {
      name = "opus-1.1.1-beta";
      src = pkgs.fetchurl {
        url = "http://downloads.us.xiph.org/releases/opus/opus-1.1.1-beta.tar.gz";
        sha256 = "1k96hrpscf9gmbms3spjasiga1k6d3k4kp69kxq18syivhwqcrhc";
      };
    });

    my_xdg_utils = pkgs.xdg_utils.overrideDerivation (attrs: {
      src = pkgs.fetchgit {
        url = "http://anongit.freedesktop.org/git/xdg/xdg-utils.git";
        rev = attrs.src.rev;
        sha256 = "0qy9h7vh6sw7wmadjvasw4sdhb9fvv7bn32ifgasdx7ag3r3939w";
      };
    });

    workEnv = pkgs.buildEnv {
      name = "workEnv";
      paths = [ pkgs.emacs ];
    };
  };
}
