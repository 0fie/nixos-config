{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = rec {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        sansSerif = [ "JetBrainsMono Nerd Font" ];
        serif = sansSerif;
      };
    };
  };
}
