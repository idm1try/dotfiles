{ ... }: {
  programs.comodoro = {
    enable = true;
    settings = {
      work = {
        preset = "pomodoro";
        tcp-port = 3724;
        tcp-host = "localhost";
      };
    };
  };
  services.comodoro = {
    enable = true;
    preset = "work";
    protocols = [ "tcp" ];
  };
}
