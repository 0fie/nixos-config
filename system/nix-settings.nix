{ config, pkgs, lib, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "me" ];
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.nixos.org/"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    # Enable auto cleanup.
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Configure nixpkgs.
  nixpkgs.config = {
    allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
