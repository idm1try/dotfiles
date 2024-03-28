{ pkgs, colors, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [ pkgs.tridactyl-native ];
    };
  };
  xdg.configFile."tridactyl/tridactylrc".text = ''
    set noiframe true
    set modeindicator false
    set hintchars etovxqpdygfblzhckisuran
    set hintuppercase false
    unbind w
    unbind W
    unbind t
    unbind T
    unbind s
    unbind S
    unbind p
    unbind P
    unbind o
    unbind O
    unbind b
    unbind B
    unbind :
    unbind <c-f>
    unbind <c-i>
  '';
  programs.firefox.profiles = let
    userChrome = ''
      :root {
        --srf-primary: #${colors.base};
        --srf-secondary: #${colors.mantle};
        --srf-text: #${colors.text};
        --srf-accent: #${colors.mauve};
      }
      window,
      #main-window,
      #toolbar-menubar,
      #TabsToolbar,
      #PersonalToolbar,
      #navigator-toolbox,
      #sidebar-box {
        background-color: #${colors.base} !important;
        -moz-appearance: none !important;
        background-image: none !important;
        border: none !important;
        box-shadow: none !important;
      }
      ::selection {
        background-color: #${colors.mauve};
        color: #${colors.base};
      }
      :root {
        --tabs-border: transparent !important;
        --inactive-titlebar-opacity: 1 !important;
      }
      .tab-background {
        border: none !important;
        border-radius: 0!important;
        margin: 0!important;
        margin-left: -1.6px!important;
        padding: 0!important;
      }
      .tab-background[selected] {
        -moz-appearance: none !important;
        background-image: none !important;
        background-color: #${colors.mantle}!important;
      }
      .tabbrowser-tabs {
        border: none !important;
        opacity: 0 !important;
      }
      .tabbrowser-tab::before, .tabbrowser-tab::after{
        opacity: 0 !important;
        border-left: none !important;
      }
      #tabbrowser-tabs {
        --tab-loading-fill: unset !important;
      }
      .titlebar-placeholder {
        border: none !important;
      }
      .tab-line {
        display: none !important;
      }
      #back-button,
      #forward-button,
      #whats-new-menu-button,
      #star-button,
      #pocket-button,
      #save-to-pocket-button
      #pageActionSeparator,
      #pageActionButton,
      #reader-mode-button,
      #urlbar-zoom-button,
      #identity-box,
      #PanelUI-button,
      #tracking-protection-icon-container {
        display: none !important;
      }
      #context-navigation,
      #context-savepage,
      #context-pocket,
      #context-sendpagetodevice,
      #context-selectall,
      #context-viewsource,
      #context-inspect-a11y,
      #context-sendlinktodevice,
      #context-openlinkinusercontext-menu,
      #context-bookmarklink,
      #context-savelink,
      #context-savelinktopocket,
      #context-sendlinktodevice,
      #context-searchselect,
      #context-sendimage,
      #context-print-selection,
      #context_bookmarkTab,
      #context_moveTabOptions,
      #context_sendTabToDevice,
      #context_reopenInContainer,
      #context_selectAllTabs,
      #context_closeTabOptions {
        display: none !important;
      }
      #save-to-pocket-button {
        visibility: hidden !important;
      }
      .titlebar-spacer {
        display: none !important;
      }
      .tabbrowser-tab:not([pinned]) .tab-close-button {
        display: none !important;
      }
      .tabbrowser-tab:not([pinned]) .tab-icon-image {
        display: none !important;
      }
      .tabbrowser-tab
        >.tab-stack
        > .tab-background { box-shadow: none !important;  }

      #navigator-toolbox::after {
        border-bottom: 0px !important;
        border-top: 0px !important;
      }
      #nav-bar {
        background: #${colors.mantle} !important;
        border: none !important;
        box-shadow: none !important;
        margin-top: 0px !important;
        border-top-width: 0px !important;
        margin-bottom: 0px !important;
        border-bottom-width: 0px !important;
      }
      #history-panel,
      #sidebar-search-container,
      #bookmarksPanel {
        background: #${colors.base} !important;
      }
      #search-box {
        -moz-appearance: none !important;
        background: #${colors.base} !important;
        border-radius: 6px !important;
      }
      #sidebar-search-container {
        background-color: #${colors.base} !important;
      }
      #sidebar-icon {
        display: none !important;
      }
      .sidebar-placesTree {
        color: #${colors.text} !important;
      }
      #sidebar-switcher-target {
        color: #${colors.text} !important;
      }
      #sidebar-header {
        background: #${colors.base} !important;
      }
      #sidebar-box {
        --sidebar-background-color: #${colors.base} !important;
      }
      #sidebar-splitter {
        border: none !important;
        opacity: 1 !important;
        background-color: #${colors.base} !important;
      }
      .urlbarView {
        display: none !important;
      }
      #urlbar-input-container {
        background-color: #${colors.mantle} !important;
        border: 1px solid rgba(0, 0, 0, 0) !important;
        border-radius: 0!important;
      }
      #urlbar-container {
        margin-left: 8px !important;
      }
      #urlbar[focused='true'] > #urlbar-background {
        box-shadow: none !important;
      }
      .urlbarView-url {
        color: #${colors.text} !important;
      }
      .titlebar-buttonbox-container { 
        display: none !important;
      }
      #urlbar-go-button {
        display: none !important;
      }
      #alltabs-button {
        display: none !important;
      }
      #unified-extensions-button { 
        color: #${colors.mantle} !important; 
      }
      .sidebar-placesTreechildren::-moz-tree-row {
        height: 2.2em !important; 
      }
      #context-navigation, #context-sep-navigation { 
        display: none !important 
      }
      #toolbar-menubar {
        display: none !important;
      }
      #browser vbox#appcontent tabbrowser,
      #content, #tabbrowser-tabpanels,
      browser[type=content-primary],
      browser[type=content] > html { 
        background: #${colors.base} !important;
      }
      #star-button-box {
        display: none !important;
      }
      #pageAction-urlbar-_testpilot-containers {
        display: none !important;
      }
      .tab-secondary-label {
        font-size: .85em !important;
        text-transform: lowercase !important;
        opacity: 0.69 !important;
      }
      .tab-icon-overlay {
        fill-opacity: 0.69 !important;
      }
    '';
    userContent = ''
      :root {
        scrollbar-width: none !important;

        --tridactyl-hint-active-fg: var(--tridactyl-hint-fg) !important;
        --tridactyl-hint-active-bg: var(--tridactyl-hint-bg) !important;
        --tridactyl-hint-active-outline: var(--tridactyl-hint-outline) !important;
        --tridactyl-hintspan-font-family: CartographCF Nerd Font !important;
      }
      @-moz-document url(about:privatebrowsing) {
        :root {
          scrollbar-width: none !important;
        }
      }
       @-moz-document url-prefix("about:newtab"), url-prefix("about:home"), url-prefix("about:privatebrowsing") {
        body {
          background-color: #${colors.base} !important;
        }
        .icon-settings,
        .body-wrapper,
        .SnippetBaseContainer,
        .search-handoff-button,
        .search-wrapper .logo-and-wordmark .wordmark,
        .search-wrapper .search-inner-wrapper,
        .search-wrapper input {
          display: none !important;
        }
      }
      @-moz-document url-prefix("about:neterror") {
        :root {
          background-color: #${colors.base} !important;
          color: #${colors.text} !important;
        }
        h1 {
          color: #${colors.text} !important;
        }
        #errorLongDesc {
          display: none;
        }
        #neterrorTryAgainButton {
          display: none;
        }
        #learnMoreLink {
          display: none;
        }
      }
      @-moz-document url-prefix("about:httpsonlyerror"), url-prefix("about:certerror") {
        :root {
          background-color: #${colors.base} !important;
          color: #${colors.text} !important;
        }
        .title {
          background-image: none !important;
        }
        ul, p, b, h2, #goBack {
          display: none !important;
        }
      }
      @-moz-document url-prefix("about:sessionrestore") {
        :root {
          background-color: #${colors.base} !important;
          color: #${colors.text} !important;
        }
        .description {
          display: none;
        }
        #tabsToggle {
          display: none;
        }
        button.primary {
          background-color: #${colors.mauve} !important;
        }
      }
      @-moz-document url-prefix("about:preferences"), 
      url-prefix("about:networking"),
      url-prefix("about:config"),
      url-prefix("about:about"),
      url-prefix("about:addons"), 
      url-prefix("about:profiles"), 
      url-prefix("about:webrtc"), 
      url-prefix("about:policies"), 
      url-prefix("about:cache"),
      url-prefix("about:studies"),
      url-prefix("about:support"),
      url-prefix("about:serviceworkers"),
      url-prefix("about:rights"),
      url-prefix("about:protections"), 
      url-prefix("about:telemetry"), 
      url-prefix("about:compat"), 
      url-prefix("about:certificate"), 
      url-prefix("about:crashes"), 
      url-prefix("about:downloads"), 
      url-prefix("about:logging"), 
      url-prefix("about:processes"), 
      url-prefix("about:profiling"), 
      url-prefix("about:robots"), 
      url-prefix("about:unloads"), 
      url-prefix("about:url-classifier"), 
      url-prefix("about:webauthn"),
      url-prefix("about:logins"),
      url-prefix("about:loginsimportreport"),
      url-prefix("about:httpsonlyerror"), 
      url-prefix("about:certerror"),
      url-prefix("about:neterror"),
      url-prefix("about:sessionrestore")
      {
        :root {
          background-color: #${colors.base} !important;
          color: #${colors.text} !important;
          --in-content-page-background: #${colors.base} !important;
          --in-content-box-background: #${colors.base} !important;
          --in-content-table-background: #${colors.base} !important;
          --in-content-box-border-color: #${colors.base} !important;
          --in-content-primary-button-background: #${colors.mauve} !important;
          --in-content-primary-button-background-hover: #d6bdff !important;
          --in-content-primary-button-background-active: #ad7aff !important;
          --link-color: #${colors.mauve} !important;
          --link-color-hover: #d6bdff !important;
          --link-color-active: #ad7aff !important;
          --color-accent-primary: #${colors.mauve} !important;
          --color-accent-primary-hover: #d6bdff !important;
          --color-accent-primary-active: #ad7aff !important;
        }
      }
    '';

    settings = {
      "app.normandy.api_url" = "";
      "app.normandy.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "app.update.auto" = false;
      "beacon.enabled" = false;
      "breakpad.reportURL" = "";
      "browser.startup.homepage" = "about:blank";
      "browser.aboutConfig.showWarning" = false;
      "browser.cache.offline.enable" = false;
      "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      "browser.crashReports.unsubmittedCheck.enabled" = false;
      "browser.disableResetPrompt" = true;
      "browser.formfill.enable" = false;
      "browser.newtab.preload" = false;
      "browser.newtabpage.activity-stream.section.highlights.includePocket" =
        false;
      "browser.newtabpage.enabled" = false;
      "browser.newtabpage.enhanced" = false;
      "browser.newtabpage.introShown" = true;
      "browser.safebrowsing.appRepURL" = "";
      "browser.safebrowsing.blockedURIs.enabled" = false;
      "browser.safebrowsing.downloads.enabled" = false;
      "browser.safebrowsing.downloads.remote.enabled" = false;
      "browser.safebrowsing.downloads.remote.url" = "";
      "browser.safebrowsing.enabled" = false;
      "browser.safebrowsing.malware.enabled" = false;
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.selfsupport.url" = "";
      "browser.send_pings" = false;
      "browser.sessionstore.privacy_level" = 0;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.startup.homepage_override.mstone" = "ignore";
      "browser.tabs.crashReporting.sendReport" = false;
      "browser.tabs.firefox-view" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.urlbar.trimURLs" = false;
      "browser.warnOnQuitShortcut" = false;
      "browser.display.background_color.dark" = "#${colors.base}";
      "browser.toolbars.bookmarks.visibility" = "never";
      "datareporting.healthreport.service.enabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "device.sensors.ambientLight.enabled" = false;
      "device.sensors.enabled" = false;
      "device.sensors.motion.enabled" = false;
      "device.sensors.orientation.enabled" = false;
      "device.sensors.proximity.enabled" = false;
      "dom.battery.enabled" = false;
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_ever_enabled" = true;
      "experiments.activeExperiment" = false;
      "experiments.enabled" = false;
      "experiments.manifest.uri" = "";
      "experiments.supported" = false;
      "extensions.CanvasBlocker@kkapsner.de.whiteList" = "";
      "extensions.ClearURLs@kevinr.whiteList" = "";
      "extensions.Decentraleyes@ThomasRientjes.whiteList" = "";
      "extensions.FirefoxMulti-AccountContainers@mozilla.whiteList" = "";
      "extensions.autoDisableScopes" = 14;
      "extensions.getAddons.cache.enabled" = false;
      "extensions.getAddons.showPane" = false;
      "extensions.pocket.enabled" = false;
      "extensions.shield-recipe-client.api_url" = "";
      "extensions.shield-recipe-client.enabled" = false;
      "extensions.webservice.discoverURL" = "";
      "media.autoplay.default" = 1;
      "media.autoplay.enabled" = false;
      "media.eme.enabled" = false;
      "media.gmp-widevinecdm.enabled" = false;
      "media.navigator.enabled" = false;
      "media.peerconnection.enabled" = false;
      "media.video_stats.enabled" = false;
      "network.IDN_show_punycode" = true;
      "network.allow-experiments" = false;
      "network.captive-portal-service.enabled" = true;
      "network.cookie.cookieBehavior" = 1;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "network.http.referer.spoofSource" = true;
      "network.http.speculative-parallel-limit" = 0;
      "network.predictor.enable-prefetch" = false;
      "network.predictor.enabled" = false;
      "network.prefetch-next" = false;
      "pdfjs.enableScripting" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.donottrackheader.value" = 1;
      "privacy.query_stripping" = true;
      "privacy.trackingprotection.cryptomining.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.fingerprinting.enabled" = true;
      "privacy.trackingprotection.pbmode.enabled" = true;
      "privacy.usercontext.about_newtab_segregation.enabled" = true;
      "security.ssl.disable_session_identifiers" = true;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" =
        false;
      "signon.autofillForms" = false;
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.cachedClientID" = "";
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.hybridContent.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.prompted" = 2;
      "toolkit.telemetry.rejected" = true;
      "toolkit.telemetry.reportingpolicy.firstRun" = false;
      "toolkit.telemetry.server" = "";
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.unifiedIsOptIn" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "webgl.renderer-string-override" = " ";
      "webgl.vendor-string-override" = " ";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "layout.css.has-selector.enabled" = true;
      "font.default.x-western" = "sans-serif";
      "font.name.monospace.x-western" = "CartographCF Nerd Font";
      "font.name.sans-serif.x-western" = "CartographCF Nerd Font";
      "font.name.serif.x-western" = "CartographCF Nerd Font";
      "font.size.monospace.x-western" = 14;
      "browser.uiCustomization.state" = ''
        {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_af37054b-3ace-46a2-ac59-709e4412bec6_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_testpilot-containers-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","ublock0_raymondhill_net-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action"],"nav-bar":["back-button","forward-button","urlbar-container","save-to-pocket-button","unified-extensions-button","reset-pbm-toolbar-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["_af37054b-3ace-46a2-ac59-709e4412bec6_-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_testpilot-containers-browser-action","jid1-bofifl9vbdl2zq_jetpack-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","ublock0_raymondhill_net-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action","developer-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar"],"currentVersion":20,"newElementCount":5}
      '';
      "browser.search.hiddenOneOffs" = "Google,Amazon.com,Bing";
      "browser.gesture.swipe.right" = "";
      "browser.gesture.swipe.left" = "";
      "browser.translations.enable" = false;
      "browser.download.dir" = "/home/idm1try/downloads";
      "browser.download.lastDir" = "/home/idm1try/downloads";
      "browser.urlbar.showSearchSuggestionsFirst" = false;
      "media.videocontrols.picture-in-picture.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "dom.forms.autocomplete.formautofill" = false;
      "full-screen-api.warning.timeout" = 0;
      "apz.gtk.touchpad_pinch.enabled" = false;
    };
  in {
    home = {
      id = 0;
      search = {
        default = "4get";
        force = true;
        engines = {
          "4get" = {
            urls = [{ template = "https://4get.ca/web?s={searchTerms}"; }];
            definedAliases = [ "4g" ];
          };
          srx = {
            urls =
              [{ template = "https://searxng.site/search?q={searchTerms}"; }];
            definedAliases = [ "srx" ];
          };
          ddg = {
            urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
            definedAliases = [ "ddg" ];
          };
          nix = {
            urls = [{
              template =
                "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}";
            }];
            definedAliases = [ "nix" ];
          };
          nhm = {
            urls = [{
              template =
                "https://github.com/nix-community/home-manager/search?q={searchTerms}";
            }];
            definedAliases = [ "nhm" ];
          };
          iv = {
            urls =
              [{ template = "https://iv.nboeck.de/search?q={searchTerms}"; }];
            definedAliases = [ "iv" ];
          };
          lr = {
            urls =
              [{ template = "https://reddit.simo.sh/search?q={searchTerms}"; }];
            definedAliases = [ "lr" ];
          };
          wiki = {
            urls = [{
              template =
                "https://en.wikipedia.org/wiki/Special:Search?search={searchTerms}";
            }];
            definedAliases = [ "wiki" ];
          };
          gh = {
            urls =
              [{ template = "https://github.com/search?q={searchTerms}"; }];
            definedAliases = [ "gh" ];
          };
          npm = {
            urls =
              [{ template = "https://www.npmjs.org/search?q={searchTerms}"; }];
            definedAliases = [ "npm" ];
          };
          osm = {
            urls = [{
              template =
                "https://www.openstreetmap.org/search?query={searchTerms}";
            }];
            definedAliases = [ "osm" ];
          };
        };
      };
      inherit settings;
      inherit userChrome;
      inherit userContent;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        amp2html
        ublock-origin
        privacy-redirect
        clearurls
        decentraleyes
        stylus
        tridactyl
        multi-account-containers
        istilldontcareaboutcookies
      ];
    };
  };
}
