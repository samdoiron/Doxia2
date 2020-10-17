with (import <nixpkgs> {});

let
  gems = bundlerEnv {
    ruby = ruby_2_7;
    name = "gems-for-doxia";
    gemdir = ./.;
  };
in mkShell {
  buildInputs = [
    nodejs-14_x nodePackages.yarn
    gems gems.wrappedRuby bundix 
  ];
}
