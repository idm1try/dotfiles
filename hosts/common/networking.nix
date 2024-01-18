{ ... }: {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.firewall.allowedTCPPorts = [ 3000 ];
  networking.wg-quick.interfaces.wg0.configFile = "/var/secrets/wg0.conf";
  networking.extraHosts = ''
    0.0.0.0 youtube.com
    0.0.0.0 www.youtube.com
    0.0.0.0 reddit.com
    0.0.0.0 www.reddit.com
    0.0.0.0 ufanet.ru
    0.0.0.0 www.ufanet.ru
    0.0.0.0 mail.ru
    0.0.0.0 www.mail.ru
    0.0.0.0 twitter.com
    0.0.0.0 www.twitter.com
    0.0.0.0 news.ycombinator.com
  '';
}
