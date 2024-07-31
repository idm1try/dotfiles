{ pkgs, ... }: {
  programs.fish.enable = true;
  users.users.marie = {
    isNormalUser = true;
    home = "/home/marie";
    extraGroups = [ "wheel" "audio" "video" "render" "input" ];
    shell = pkgs.fish;
  };
}
