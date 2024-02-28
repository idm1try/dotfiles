{ ... }: {
  programs.himalaya = {
    enable = true;
    settings.accounts.idm1try = {
      backend = "imap";
      email = "dimasavchenko1706@icloud.com";
      default = true;
      display-name = "idm1try";
      imap.host = "imap.mail.me.com";
      imap.port = 993;
      imap.encryption = true;
      imap.login = "dimasavchenko1706@icloud.com";
      imap.auth = "passwd";
      imap.passwd.cmd = "cat /var/secrets/mail";
      message.send.backend = "smtp";
      smtp.host = "smtp.mail.me.com";
      smtp.port = 587;
      smtp.encryption = "start-tls";
      smtp.login = "dimasavchenko1706@icloud.com";
      smtp.auth = "passwd";
      smtp.passwd.cmd = "cat /var/secrets/mail";
    };
  };
}
