{ hostname, username, cwd }:
let
  flakeExists = (builtins.pathExists (cwd + "/flake.nix"));

  nixpkgs-expr = import <nixpkgs> {};

  nixos-expr =
  let
    flake = if flakeExists
      then builtins.getFlake (toString cwd)
      else {};
    hasTarget = flake ? nixosConfigurations && flake.nixosConfigurations ? ${hostname};
    optionSet = if hasTarget
      then flake.nixosConfigurations.${hostname}.options
      else {};
  in
    optionSet
  ;

  home-manager-expr =
  let
    flake = builtins.getFlake (toString ./.);
    userHost = username "@" + builtins.getEnv "HOST";
    target = if flake ? homeConfigurations && flake.homeConfigurations ? userHost
      then userHost
      else builtins.head (builtins.attrNames (flake.homeConfigurations or {}));
  in
    flake.homeConfigurations.${target}.options
  ;
in
{
  inherit nixos-expr;
  inherit home-manager-expr;
  inherit nixpkgs-expr;
}
