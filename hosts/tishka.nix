{ ... }: {
  imports = [ ./common/darwin ];
  security.pam.enableSudoTouchIdAuth = true;

  networking = {
    hostName = "tishka";
    computerName = "tishka";
    localHostName = "tishka";
  };
}
