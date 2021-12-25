{ modulesPath, ... }:

let
  trisModules = ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "an-empty-string";
    repo = "nixos-modules";
    rev = "d5a2e0615c304e3b631a50bfe049a7515043498e";
    hash = "sha256-xitIQFER+ywVGRYCLa7tWYV1V0KfVbXN+Nxg4X6pRIc=";
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
