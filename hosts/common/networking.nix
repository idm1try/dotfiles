{ ... }: {
  networking.wireless.iwd.enable = true;
  networking.extraHosts = ''
    0.0.0.0 youtube.com
    0.0.0.0 www.youtube.com
    0.0.0.0 ufanet.ru
    0.0.0.0 www.ufanet.ru
    0.0.0.0 mail.ru
    0.0.0.0 www.mail.ru
    0.0.0.0 twitter.com
    0.0.0.0 www.twitter.com
    0.0.0.0 news.ycombinator.com
  '';
}
