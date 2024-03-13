{ pkgs, inputs, userName, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./helix.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./lf.nix
    ./mako.nix
    ./nautilus.nix
    ./neofetch.nix
    ./nushell.nix
    ./pyprland.nix
    ./rofi.nix
    ./services.nix
    ./spotify.nix
    ./starship.nix
    ./tools.nix
    ./waybar.nix
    ./xdg.nix
    ./zathura.nix
    ./zsh.nix
    inputs.hyprland.homeManagerModules.default
    inputs.hypridle.homeManagerModules.hypridle
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # Info required by home-manager.
  home = {
    username = "${userName}";
    homeDirectory = "/home/${userName}";
    stateVersion = "23.11";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_USE_WAYLAND = "1";
      DIRENV_LOG_FORMAT = "";
      POLKIT_BIN =
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  programs.home-manager.enable = true;
}
