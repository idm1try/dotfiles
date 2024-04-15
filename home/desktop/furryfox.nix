{ pkgs, colors, inputs, ... }: {
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
      .infobar {
        background-color: #${colors.base} !important;
        margin: 0px !important;
        border-radius: 0px !important;
        border: none !important;
      }
      .infobar::before {
        display: none !important;
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
      @-moz-document regexp("^(?!.*.pdf?normal).*") {
          :root {
            --body-bg-color: #${colors.base} !important;
            --main-color: #${colors.text} !important;
            --toolbar-bg-color: #${colors.base} !important;
            --field-color: #${colors.text} !important;
            --field-bg-color: #${colors.mantle} !important;
            --field-border-color: #${colors.surface0} !important;
            --sidebar-toolbar-bg-color: #${colors.base} !important;
            --toolbar-icon-bg-color: #${colors.overlay2} !important;
            --toolbar-icon-hover-bg-color: #${colors.subtext0} !important;
            --toolbar-border-color: #${colors.crust}00 !important;
            --dropdown-btn-bg-color: #${colors.mantle} !important;
            --button-hover-color: #${colors.surface0} !important;
            --separator-color: #${colors.base} !important;
            --doorhanger-bg-color: #${colors.mantle} !important;
            --doorhanger-border-color: #${colors.crust}00 !important;
            --doorhanger-hover-color: #${colors.text} !important;
            --doorhanger-hover-bg-color: #${colors.surface0} !important;
            --doorhanger-separator-color: #${colors.surface0} !important;
            --progressBar-color: #${colors.mauve} !important;
            --progressBar-bg-color: #${colors.base} !important;
            --progressBar-blend-color: #${colors.mauve}70 !important;
            --toggled-btn-color: #${colors.text} !important;
            --toggled-btn-bg-color: #${colors.surface0}70 !important;
            --toggled-hover-active-btn-color: #${colors.surface0} !important;
            --scrollbar-color: #${colors.crust}00 !important;
            --scrollbar-bg-color: #${colors.crust}00 !important;
          }
          .editorParamsToolbarContainer .editorParamsSlider::-moz-range-progress {
            background-color: #${colors.mauve} !important;
          }
          :is(.toolbarButton, .secondaryToolbarButton).toggled, .splitToolbarButton.toggled > .toolbarButton.toggled {
            background-color: #${colors.crust} !important;
          }
          .dropdownToolbarButton > select {
            height: 26px !important;
            font-size: 13px !important;
          }
          .toolbarField {
            border: 0px !important;
            border-radius: 0px !important;
            padding: 3px 8px !important;
            margin: 3px !important;
            border: 0px !important;
            color: #${colors.text} !important;
            font-size: 13px !important;
          }
          #zoomOut, #zoomIn, #next, #previous {
            display: none !important;
          }
      }
      @-moz-document url-prefix(about:devtools), url-prefix(chrome:) {
        :root {
           --theme-body-background: #${colors.base} !important;
           --theme-body-emphasized-background: #${colors.base} !important;
           --theme-body-alternate-emphasized-background: #${colors.base} !important;
           --theme-sidebar-background: #${colors.base} !important;
           --theme-tab-toolbar-background: #${colors.mantle} !important;
           --theme-focus-outline-color: #${colors.mauve} !important;
           --theme-toolbar-background: #${colors.base} !important;
           --theme-toolbar-color: #${colors.overlay0} !important;
           --theme-toolbar-selected-color: #${colors.mauve} !important;
           --theme-toolbar-highlighted-color: #${colors.green} !important;
           --theme-toolbar-background-hover: #${colors.surface0} !important;
           --theme-toolbar-background-alt: #${colors.base} !important;
           --theme-toolbar-background-highlighted: #${colors.mauve} !important;
           --theme-toolbar-error-background: #${colors.red} !important;
           --theme-toolbar-hover: #${colors.surface0} !important;
           --theme-toolbar-hover-active: #${colors.surface0} !important;
           --theme-toolbar-separator: #${colors.surface0} !important;
           --toolbarbutton-background: #${colors.surface1} !important;
           --toolbarbutton-hover-background: #${colors.surface1} !important;
           --toolbarbutton-focus-background: #${colors.surface0} !important;
           --toolbarbutton-focus-color: #${colors.subtext0} !important;
           --toolbarbutton-checked-background: #${colors.mauve} !important;
           --toolbarbutton-checked-focus-background: #${colors.mauve} !important;
           --toolbarbutton-checked-color: #${colors.text} !important;
           --theme-accordion-header-background: #${colors.surface0} !important;
           --theme-accordion-header-hover: #${colors.surface1} !important;
           --theme-selection-background: #${colors.surface0} !important;
           --theme-selection-background-hover: #${colors.surface0}80 !important;
           --theme-selection-focus-background: #${colors.surface1} !important;
           --theme-selection-color: #${colors.subtext0} !important;
           --theme-splitter-color: #${colors.surface0};
           --theme-emphasized-splitter-color: #${colors.surface0};
           --theme-emphasized-splitter-color-hover: #${colors.surface1};
           --theme-icon-color: #${colors.overlay0} !important;
           --theme-icon-dimmed-color: #${colors.overlay0} !important;
           --theme-icon-checked-color: #${colors.mauve} !important;
           --theme-icon-error-color: #${colors.red} !important;
           --theme-icon-warning-color: #${colors.yellow} !important;
           --theme-comment: #${colors.overlay1} !important;
           --theme-body-color: #${colors.overlay1} !important;
           --theme-link-color: #${colors.mauve} !important;
           --theme-text-color-alt: #${colors.overlay1} !important;
           --theme-text-color-inactive: #${colors.overlay0} !important;
           --theme-text-color-error: #${colors.subtext0} !important;
           --theme-text-color-strong: #${colors.text} !important;
           --theme-stack-trace-text: #${colors.red} !important; 
           --theme-highlight-green: #${colors.green} !important;
           --theme-highlight-blue: #${colors.mauve} !important;
           --theme-highlight-purple: #${colors.green} !important;
           --theme-highlight-red: #${colors.teal} !important;
           --theme-highlight-yellow: #${colors.yellow} !important;
           --theme-highlight-bluegrey: #${colors.blue} !important;
           --theme-highlight-lightorange: #${colors.peach} !important;
           --theme-highlight-orange: #${colors.peach} !important;
           --theme-highlight-pink: #${colors.pink} !important;
           --theme-highlight-gray: #${colors.subtext0} !important;
           --theme-graphs-purple: #${colors.mauve} !important;
           --theme-graphs-yellow: #${colors.yellow} !important;
           --theme-graphs-orange: #${colors.peach} !important;
           --theme-graphs-grey: #${colors.overlay0} !important;
           --theme-graphs-full-red: #${colors.red} !important;
           --theme-popup-background: #${colors.mantle} !important;
           --theme-popup-color: #${colors.overlay2} !important;
           --theme-popup-border-color: #${colors.crust}00 !important;
           --theme-toolbarbutton-background: #${colors.base} !important;
           --theme-toolbarbutton-color: #${colors.overlay0} !important;
           --theme-toolbarbutton-hover-background: #${colors.surface0} !important;
           --theme-toolbarbutton-checked-background: #${colors.surface1} !important;
           --theme-toolbarbutton-checked-color: #${colors.subtext0} !important;
           --theme-toolbarbutton-checked-hover-background: #${colors.surface2} !important;
           --theme-toolbarbutton-checked-hover-color: #${colors.subtext0} !important;
           --theme-toolbarbutton-active-background: #${colors.surface1} !important;
           --theme-toolbarbutton-active-color: #${colors.subtext0} !important;
           --theme-select-background: #${colors.surface0} !important;
           --theme-select-color: #${colors.text} !important;
           --theme-select-hover-border-color: #${colors.surface1} !important;
           --theme-contrast-background: #${colors.yellow}40 !important;
           --theme-contrast-background-alpha: #${colors.yellow}20 !important;
           --theme-contrast-color: #${colors.subtext0} !important;
           --theme-contrast-border: #${colors.yellow} !important;
           --table-selection-background-hover: #${colors.surface0} !important;
           --tab-line-selected-color: #${colors.crust}00 !important;
        }
        ::selection {
          background-color: #${colors.surface2} !important;
        }
        .perf-photon-button-primary { background-color: #${colors.surface0} !important; }
        .perf-photon-button-primary:hover { background-color: #${colors.surface1} !important; }
        .devtools-tab-line { display: none !important; }
      }
    '';

    settings = {
      "app.normandy.api_url" = "";
      "app.normandy.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "app.update.auto" = false;
      "app.update.enabled" = false;
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
      "browser.safebrowsing.provider.google.updateURL" = "";
      "browser.safebrowsing.provider.google.gethashURL" = "";
      "browser.safebrowsing.provider.google4.updateURL" = "";
      "browser.safebrowsing.provider.google4.gethashURL" = "";
      "browser.safebrowsing.provider.mozilla.gethashURL" = "";
      "browser.safebrowsing.provider.mozilla.updateURL" = "";
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
      "datareporting.healthreport.about.reportUrl" = "http://127.0.0.1/";
      "datareporting.healthreport.documentServerURI" = "http://127.0.0.1/";
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
      "media.eme.apiVisible" = false;
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
      "browser.download.dir" = "/tmp/downloads";
      "browser.download.lastDir" = "/tmp/downloads";
      "browser.urlbar.showSearchSuggestionsFirst" = false;
      "media.videocontrols.picture-in-picture.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "dom.forms.autocomplete.formautofill" = false;
      "full-screen-api.warning.timeout" = 0;
      "apz.gtk.touchpad_pinch.enabled" = false;
      "privacy.resistFingerprinting.block_mozAddonManager" = true;
      "extensions.webextensions.restrictedDomains" = true;
      "extensions.update.autoUpdateDefault" = false;
      "extensions.update.enabled" = false;
      "extensions.allowPrivateBrowsingByDefault" = true;
      "browser.download.useDownloadDir" = false;
      "browser.translation.engine" = "";
      "media.gmp-provider.enabled" = false;
      "browser.newtabpage.activity-stream.feeds.topsites" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
        false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
        false;
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.topsites" = false;
      "browser.search.suggest.enabled" = false;
      "security.OCSP.enabled" = 0;
      "security.OCSP.require" = false;
      "app.support.baseURL" = "http://127.0.0.1/";
      "app.support.inputURL" = "http://127.0.0.1/";
      "app.feedback.baseURL" = "http://127.0.0.1/";
      "browser.uitour.url" = "http://127.0.0.1/";
      "browser.uitour.themeOrigin" = "http://127.0.0.1/";
      "plugins.update.url" = "http://127.0.0.1/";
      "browser.customizemode.tip0.learnMoreUrl" = "http://127.0.0.1/";
      "browser.dictionaries.download.url" = "http://127.0.0.1/";
      "browser.search.searchEnginesURL" = "http://127.0.0.1/";
      "layout.spellcheckDefault" = 0;
      "browser.urlbar.update2.engineAliasRefresh" = true;
      "browser.discovery.containers.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.discovery.sites" = "http://127.0.0.1/";
      "services.sync.prefs.sync.browser.startup.homepage" = false;
      "browser.contentblocking.report.monitor.home_page_url" =
        "http://127.0.0.1/";
      "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
      "social.enabled" = false;
      "social.remote-install.enabled" = false;
      "social.directories" = "";
      "services.sync.privacyURL" = "http://127.0.0.1/";
      "healthreport.uploadEnabled" = false;
      "social.toast-notifications.enabled" = false;
      "browser.slowStartup.notificationDisabled" = true;
      "plugins.enumerable_names" = "";
      "plugin.state.flash" = 0;
      "browser.search.update" = false;
      "camera.control.face_detection.enabled" = false;
      "camera.control.autofocus_moving_callback.enabled" = false;
      "browser.urlbar.userMadeSearchSuggestionsChoice" = true;
      "security.certerrors.mitm.priming.enabled" = false;
      "security.certerrors.recordEventTelemetry" = false;
      "urlclassifier.trackingTable" =
        "test-track-simple,base-track-digest256,content-track-digest256";
      "browser.newtabpage.directory.source" = "";
      "browser.newtabpage.directory.ping" = "";
      "captivedetect.canonicalURL" = "";
      "geo.enabled" = false;
      "geo.wifi.uri" = "";
      "browser.search.geoip.url" = "";
      "browser.search.geoSpecificDefaults" = false;
      "browser.search.geoSpecificDefaults.url" = "";
      "browser.search.modernConfig" = false;
      "gecko.handlerService.schemes.mailto.0.name" = "";
      "gecko.handlerService.schemes.mailto.1.name" = "";
      "handlerService.schemes.mailto.1.uriTemplate" = "";
      "gecko.handlerService.schemes.mailto.0.uriTemplate" = "";
      "browser.contentHandlers.types.0.title" = "";
      "browser.contentHandlers.types.0.uri" = "";
      "browser.contentHandlers.types.1.title" = "";
      "browser.contentHandlers.types.1.uri" = "";
      "gecko.handlerService.schemes.webcal.0.name" = "";
      "gecko.handlerService.schemes.webcal.0.uriTemplate" = "";
      "gecko.handlerService.schemes.irc.0.name" = "";
      "gecko.handlerService.schemes.irc.0.uriTemplate" = "";
      "media.peerconnection.ice.no_host" = true;
      "media.peerconnection.ice.default_address_only" = true;
      "identity.fxaccounts.enabled" = false;
      "extensions.blocklist.enabled" = false;
      "extensions.getAddons.search.url" = "http://127.0.0.1/";
      "extensions.getAddons.search.browseURL" = "http://127.0.0.1/";
      "extensions.getAddons.get.url" = "http://127.0.0.1/";
      "extensions.getAddons.link.url" = "http://127.0.0.1/";
      "extensions.getAddons.discovery.api_url" = "http://127.0.0.1/";
      "extensions.systemAddon.update.url" = "";
      "extensions.systemAddon.update.enabled" = false;
      "extensions.getAddons.langpacks.url" = "http://127.0.0.1/";
      "lightweightThemes.getMoreURL" = "http://127.0.0.1/";
      "browser.geolocation.warning.infoURL" = "";
      "browser.xr.warning.infoURL" = "";
      "privacy.announcements.enabled" = false;
      "browser.snippets.enabled" = false;
      "browser.snippets.syncPromo.enabled" = false;
      "identity.mobilepromo.android" = "http://127.0.0.1/";
      "browser.snippets.geoUrl" = "http://127.0.0.1/";
      "browser.snippets.updateUrl" = "http://127.0.0.1/";
      "browser.snippets.statsUrl" = "http://127.0.0.1/";
      "datareporting.policy.firstRunTime" = 0;
      "datareporting.policy.dataSubmissionPolicyVersion" = 2;
      "browser.webapps.checkForUpdates" = 0;
      "browser.webapps.updateCheckUrl" = "http://127.0.0.1/";
      "app.faqURL" = "http://127.0.0.1/";
      "media.gmp-manager.url.override" = "data:text/plain,";
      "media.gmp-manager.url" = "";
      "media.gmp-manager.updateEnabled" = false;
      "media.gmp-gmpopenh264.enabled" = false;
      "media.gmp-eme-adobe.enabled" = false;
      "browser.apps.URL" = "";
      "loop.enabled" = false;
      "browser.aboutHomeSnippets.updateUrl" = "data:text/html";
      "browser.user_preferences.moreFromMozilla" = false;
      "security.ssl.errorReporting.enabled" = false;
      "security.tls.unrestricted_rc4_fallback" = false;
      "security.tls.insecure_fallback_hosts.use_static_list" = false;
      "security.tls.version.min" = 1;
      "security.ssl.require_safe_negotiation" = false;
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "security.ssl3.rsa_seed_sha" = true;
      "security.ssl3.dhe_rsa_aes_128_sha" = false;
      "security.ssl3.dhe_rsa_aes_256_sha" = false;
      "security.ssl3.dhe_dss_aes_128_sha" = false;
      "security.ssl3.dhe_rsa_des_ede3_sha" = false;
      "security.ssl3.rsa_des_ede3_sha" = false;
      "browser.pocket.enabled" = false;
      "extensions.screenshots.disabled" = true;
      "browser.onboarding.newtour" =
        "performance,private,addons,customize,default";
      "browser.onboarding.updatetour" =
        "performance,library,singlesearch,customize";
      "browser.onboarding.enabled" = false;
      "dom.webnotifications.enabled" = false;
      "dom.webnotifications.serviceworker.enabled" = false;
      "dom.push.enabled" = false;
      "browser.newtabpage.activity-stream.asrouter.useruser_prefs.cfr" = false;
      "extensions.htmlaboutaddons.discover.enabled" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "services.settings.server" = "";
      "browser.region.network.scan" = false;
      "browser.region.network.url" = "";
      "browser.contentblocking.report.hide_vpn_banner" = true;
      "browser.contentblocking.report.mobile-ios.url" = "";
      "browser.contentblocking.report.mobile-android.url" = "";
      "browser.contentblocking.report.show_mobile_app" = false;
      "browser.contentblocking.report.vpn.enabled" = false;
      "browser.contentblocking.report.vpn.url" = "";
      "browser.contentblocking.report.vpn-promo.url" = "";
      "browser.contentblocking.report.vpn-android.url" = "";
      "browser.contentblocking.report.vpn-ios.url" = "";
      "browser.privatebrowsing.promoEnabled" = false;
      "plugins.hide_infobar_for_missing_plugin" = true;
      "plugins.hide_infobar_for_outdated_plugin" = true;
      "plugins.notifyMissingFlash" = false;
      "privacy.firstparty.isolate" = true;
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
      extensions = with inputs.firefox-addons.packages."aarch64-linux"; [
        amp2html
        ublock-origin
        privacy-redirect
        clearurls
        decentraleyes
        stylus
        tridactyl
        istilldontcareaboutcookies
      ];
    };
  };
}
