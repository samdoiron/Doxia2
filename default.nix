with (import <nixpkgs> {});

let bundler = pkgs.bundler.override { ruby = jruby; };
in mkShell {
  buildInputs = [
    jruby
    nodejs-13_x nodePackages.yarn
  ];
  shellHook = ''
  export GEM_HOME=$HOME/.gems/jruby-doxia
  export PATH=$PATH:"$HOME/.gems/jruby-doxia/bin"
  '';
}
