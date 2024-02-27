{ pkgs, ... }: {
  programs.fish.enable = true;
  users.users.idm1try = {
    isNormalUser = true;
    home = "/home/idm1try";
    extraGroups = [ "wheel" "audio" "video" "render" "input" ];
    shell = pkgs.fish;
  };
}
