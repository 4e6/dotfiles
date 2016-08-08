{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs: rec {

    envDefault = pkgs.buildEnv {
      name = "default-env";
      paths = with pkgs;
      [ ag
        emacs
        git
        neovim
        parallel
        ranger
      ];
    };

    envNotebook = pkgs.buildEnv {
      name = "notebook-env";
      paths = with pkgs;
      [ (python35.buildEnv.override {
          ignoreCollisions = true;
          extraLibs = with python35Packages;
          [
            jupyter_client
            jupyter_console
            matplotlib
            numpy
            tornado
          ];
        })
      ];
    };

  };
}
