{ ... }: {
  accounts.email.accounts.marie = {
    primary = true;
    userName = "marie";
    realName = "Marie Savchenko";
    address = "mariesavch@icloud.com";
    passwordCommand = "cat /var/secrets/mail";
    imap = {
      host = "imap.mail.me.com";
      port = 993;
    };
    smtp = {
      host = "smtp.mail.me.com";
      port = 587;
      tls.useStartTls = true;
    };
    himalaya.enable = true;
  };
  programs.himalaya.enable = true;
}
