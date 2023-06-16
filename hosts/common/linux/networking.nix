{ ... }: {
  networking.networkmanager.enable = true;
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
  systemd.services.NetworkManager-wait-online.enable = false;
}
