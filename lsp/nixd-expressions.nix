cwd:
let
  flakeExists = (builtins.pathExists (cwd + "/flake.nix"));

  hostNameImpure = builtins.readFile "/etc/hostname";
  hostName = builtins.replaceStrings ["\n"] [""] hostNameImpure;

  userName = builtins.getEnv "USER";

  nixpkgs-expr = import <nixpkgs> {};

  nixos-expr =
  let
    flake = if flakeExists
      then builtins.getFlake (toString cwd)
      else {};
    hasTarget = flake ? nixosConfigurations && flake.nixosConfigurations ? ${hostName};
    optionSet = if hasTarget
      then flake.nixosConfigurations.${hostName}.options
      else {};
  in
    optionSet
    #optionSet
  ;

  home-manager-expr =
  let
    flake = builtins.getFlake (toString ./.);
    userHost = builtins.getEnv "USER" + "@" + builtins.getEnv "HOST";
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
