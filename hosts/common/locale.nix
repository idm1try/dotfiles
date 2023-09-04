{ ... }: {
  time.timeZone = "Asia/Yekaterinburg";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_TIME = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };
}
