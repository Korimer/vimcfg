{ hostname, username, cwd }:
let
  pEx = path: builtins.pathExists (cwd + "/${path}");
  rootFile = if pEx "flake.nix" then "flake"
          else if pEx "configuration.nix" then "config"
          else if pEx "default.nix" then "default"
          else "";
  toImport = { # Lazily evaluated so no errors if doesnt exist
    flake = builtins.getFlake (toString cwd);
    config = import (cwd + "/configuration.nix");
    default = import (cwd + "/default.nix");
  };

  configuration = if (toImport ? ${rootFile})
    then toImport.rootFile
    else {};

  getFirstPresent = options: attrSet: builtins.foldl'
    (acc: elem:
     if acc == null && (attrSet ? ${elem})
       then attrSet.${elem}
       else acc)
    null
    options;


  # Outputs
  nixpkgs-expr = import <nixpkgs> {};

  nixos-expr =
  let
    nixosConfigurations = if configuration ? nixosConfigurations
      then configuration.nixosConfigurations
      else {_nonexistent = {};};
    firstConfiguration = builtins.head (builtins.attrNames nixosConfigurations);
    target = getFirstPresent
      ["${hostname}" "default"]
      nixosConfigurations;

    # Pick host-specific config if it exists
    # Otherwise pick default config if it exists
    # Otherwise pick the first (if any) config present
    optionSet = if target != null
      then nixosConfigurations.${target}.options
      else nixosConfigurations.${firstConfiguration};
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
