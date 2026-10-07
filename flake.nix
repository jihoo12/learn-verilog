{
  description = "Verilog development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          iverilog
          gtkwave
        ];

        shellHook = ''
          echo "Verilog development environment"
          echo "  iverilog: $(iverilog -V 2>&1 | head -n 1)"
          echo "  gtkwave:  $(gtkwave --version 2>&1 | head -n 1)"
        '';
      };
    };
}
