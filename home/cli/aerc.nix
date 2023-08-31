{ colors, ... }: {
  programs = {
    aerc = {
      enable = true;
      extraConfig = {
        ui = {
          border-char-vertical = "│";
          border-char-horizontal = "─";
          styleset-name = "carbon";
        };
        filters = {
          "text/plain" = "colorize";
          "text/html" = "html";
          "text/calendar" = "calendar";
          "message/delivery-status" = "colorize";
          "message/rfc822" = "colorize";
        };
      };
      stylesets.carbon = ''
        border.fg=#${colors.base}
        error.fg=#${colors.red}
        warning.fg=#${colors.yellow}
        success.fg=#${colors.blue}
        msglist_unread.fg=#${colors.mauve}
        msglist_unread.bold=true
        msglist_marked.bg=#${colors.blue}
        msglist.selected.bold=true
        dirlist_unread.fg=#${colors.mauve}
        *.selected.reverse="toggle"
        tab.fg=#${colors.overlay0}
        tab.selected.bg=#${colors.mauve}
        tab.selected.fg=#${colors.base}
        tab.selected.bold=true
        tab.selected.italic=true
        dirlist_*.selected.bold=true
        statusline_default.fg=#${colors.overlay0}
        statusline_default.italic=true

        [viewer]
        url.fg=#${colors.mauve}
        header.bold=true
        signature.dim=true
        diff_meta.bold=true
        diff_chunk.fg=#${colors.blue}
        diff_add.fg=#${colors.green}
        diff_del.fg=#${colors.red}
        quote_*.fg=#${colors.overlay0}
      '';
      extraBinds = {
        global = {
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
          "<C-t>" = ":term<Enter>";
          "?" = ":help keys<Enter>";
        };

        messages = {
          q = ":quit<Enter>";
          j = ":next<Enter>";
          k = ":prev<Enter>";
          "<Up>" = ":prev<Enter>";
          "<Down>" = ":next<Enter>";
          "<C-d>" = ":next 50%<Enter>";
          "<C-u>" = ":prev 50%<Enter>";
          "<C-f>" = ":next 100%<Enter>";
          "<C-b>" = ":prev 100%<Enter>";
          "<PgDn>" = ":next 100%<Enter>";
          "<PgUp>" = ":prev 100%<Enter>";
          g = ":select 0<Enter>";
          G = ":select -1<Enter>";

          H = ":collapse-folder<Enter>";
          J = ":next-folder<Enter>";
          K = ":prev-folder<Enter>";
          L = ":expand-folder<Enter>";

          v = ":mark -t<Enter>";
          V = ":mark -v<Enter>";

          T = ":toggle-threads<Enter>";

          "<Enter>" = ":view<Enter>";
          d = ":prompt 'Really delete this message?' 'delete-message'<Enter>";
          D = ":delete<Enter>";
          A = ":archive flat<Enter>";

          C = ":compose<Enter>";

          rr = ":reply -a<Enter>";
          rq = ":reply -aq<Enter>";
          Rr = ":reply<Enter>";
          Rq = ":reply -q<Enter>";

          c = ":cf<space>";
          "$" = ":term<space>";
          "!" = ":term<space>";
          "|" = ":pipe<space>";

          "/" = ":search<space>";
          "\\" = ":filter<space>";
          n = ":next-result<Enter>";
          N = ":prev-result<Enter>";
          "<Esc>" = ":clear<Enter>";
        };

        "messages:folder=Drafts" = { "<Enter>" = ":recall<Enter>"; };

        view = {
          "/" = ":toggle-key-passthrough<Enter>/";
          q = ":close<Enter>";
          O = ":open<Enter>";
          S = ":save<space>";
          "|" = ":pipe<space>";
          D = ":delete<Enter>";
          A = ":archive flat<Enter>";

          "<C-l>" = ":open-link <space>";

          f = ":forward<Enter>";
          rr = ":reply -a<Enter>";
          rq = ":reply -aq<Enter>";
          Rr = ":reply<Enter>";
          Rq = ":reply -q<Enter>";

          H = ":toggle-headers<Enter>";
          "<C-k>" = ":prev-part<Enter>";
          "<C-j>" = ":next-part<Enter>";
          K = ":prev<Enter>";
          J = ":next<Enter>";
        };

        "view::passthrough" = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<Esc>" = ":toggle-key-passthrough<Enter>";
        };

        "compose" = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-k>" = ":prev-field<Enter>";
          "<C-j>" = ":next-field<Enter>";
          "<A-p>" = ":switch-account -p<Enter>";
          "<A-n>" = ":switch-account -n<Enter>";
          "<tab>" = ":next-field<Enter>";
          "<backtab>" = ":prev-field<Enter>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };

        "compose::editor" = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-k>" = ":prev-field<Enter>";
          "<C-j>" = ":next-field<Enter>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };

        "compose::review" = {
          y = ":send<Enter>";
          n = ":abort<Enter>";
          v = ":preview<Enter>";
          p = ":postpone<Enter>";
          q = ":choose -o d discard abort -o p postpone postpone<Enter>";
          e = ":edit<Enter>";
          a = ":attach<space>";
          d = ":detach<space>";
        };

        "terminal" = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };
      };
    };
  };
}