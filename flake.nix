{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixvim,
    ...
  }: {
    packages.x86_64-linux.default = nixvim.legacyPackages.x86_64-linux.makeNixvim {
      imports = [./default.nix];
    };
  };
}
