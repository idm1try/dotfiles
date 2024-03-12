{ ... }: {
  accounts.email.accounts.idm1try = {
    primary = true;
    userName = "idm1try";
    realName = "Dmitry Savchenko";
    address = "idm1try@icloud.com";
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
