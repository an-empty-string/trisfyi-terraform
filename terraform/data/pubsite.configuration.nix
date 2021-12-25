{ modulesPath, ... }:

let
  trisModules = ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "an-empty-string";
    repo = "nixos-modules";
    rev = "cf40b8302171e5d5e2604240640da6f213d9e405";
    hash = "sha256-henZlYzGNkAGt+BawJ1/LM5p+TdZXqUy//ylieJ1BWY=";
  });
in
{
  imports = [
    "${modulesPath}/virtualisation/amazon-image.nix"
    "${trisModules}/machines/gemsite.nix"
  ];

  ec2.hvm = true;
  ec2.efi = true;
}
