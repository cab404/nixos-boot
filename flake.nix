{
  description = "A NixOS Plymouth theme displaying a fancy growing and shrinking NixOS Logo";

  outputs = inputs@{nixpkgs, ...}:
  {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./. {};
    nixosModules.default = ./modules.nix;
  };
}
