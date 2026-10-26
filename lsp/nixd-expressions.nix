{ hostname, username, cwd }:
let
  pEx = path: builtins.pathExists (cwd + "/${path}");

  configuration =
    if pEx "flake.nix" then
      builtins.getFlake cwd
    else if pEx "configuration.nix" then
      import (cwd + "/configuration.nix")
    else if pEx "default.nix" then
      import (cwd + "/default.nix")
    else {};

  getAny = attrSet: builtins.head (builtins.attrNames attrSet);

  getFirstPresent = options: attrSet: builtins.foldl'
    (acc: elem:
     if acc == null && (attrSet ? ${elem})
       then elem
       else acc)
    null
    options;


  # Outputs
  nixpkgs-expr = import <nixpkgs> {};

  # Generally exported by flake-parts
  debug-expr =
  let
    optionSet = if configuration ? debug
      then configuration.debug
      else {};
  in
    optionSet;

  # Generally exported by flake-parts, the sequel
  currentSystem-expr =
  let
    optionSet = if configuration ? currentSystem && configuration.currentSystem ? options
      then configuration.currentSystem.options
      else {};
  in
    optionSet;

  nixos-expr =
  let
    nixosConfigurations = if configuration ? nixosConfigurations
      then configuration.nixosConfigurations
      else {_nonexistent = {};};

    # Pick host-specific config if it exists
    # Otherwise pick default config if it exists
    targetConfiguration = getFirstPresent
      ["${hostname}" "default"]
      nixosConfigurations;
    # Otherwise pick the first (if any) config present
    arbitraryConfiguration = getAny nixosConfigurations;

    optionSet = if targetConfiguration != null
      then nixosConfigurations.${targetConfiguration}.options
      else nixosConfigurations.${arbitraryConfiguration};
  in
    optionSet
  ;

  home-manager-expr =
  let
    homeConfigurations = if configuration ? homeConfigurations
      then configuration.homeConfigurations
      else {_nonexistent = {};};

    # Pick host-specific config if it exists
    # Pick user-specific config if it exists
    # Otherwise pick default config if it exists
    targetHome = getFirstPresent
      ["${username}@${hostname}" "${username}" "default"]
      homeConfigurations;
    # Otherwise pick the first (if any) config present
    arbitraryHome = getAny homeConfigurations;

    optionSet = if targetHome != null
      then homeConfigurations.${targetHome}.options
      else homeConfigurations.${arbitraryHome};
  in
    optionSet
  ;
in
{
  inherit nixpkgs-expr;
  inherit debug-expr;
  inherit currentSystem-expr;
  inherit nixos-expr;
  inherit home-manager-expr;
}
