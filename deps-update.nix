with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    nodejs-13_x nodePackages.yarn
    jruby
  ];
}
