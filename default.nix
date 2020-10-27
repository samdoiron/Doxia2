with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    entr
    ruby_2_7
    nodejs-13_x nodePackages.yarn
  ];
}
