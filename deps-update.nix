with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    nodejs-13_x nodePackages.yarn
    ruby_2_7

    libiconv zlib # For nokogiri
  ];
}
