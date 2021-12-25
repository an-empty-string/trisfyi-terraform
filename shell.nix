{ pkgs ? import <nixpkgs> {} }:

let
  nix-reconfigure = pkgs.writeShellScriptBin "nix-reconfigure" ''
    scp $2 root@$1:/etc/nixos/configuration.nix
    ssh root@$1 nixos-rebuild switch
  '';
in pkgs.mkShell {
  buildInputs = with pkgs; [
    awscli2
    nix-reconfigure
    terraform
  ];
}
