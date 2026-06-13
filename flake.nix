{
  description = "A very basic flake";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
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
