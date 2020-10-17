with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    nodejs-14_x nodePackages.yarn
    ruby_2_7 bundix 
  ];
}
