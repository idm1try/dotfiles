final: prev: {
  screenshot = prev.writeShellScriptBin "screenshot" ''
    ${prev.grim}/bin/grim -g "$(${prev.slurp}/bin/slurp -b '#18182577' -c '#11111b' -w 1)" - -t png | ${prev.wl-clipboard}/bin/wl-copy -t image/png && ${prev.libnotify}/bin/notify-send -a "Screenshot Captured" "Copied to clipboard" -t 888
  '';
  fullscreenshot = prev.writeShellScriptBin "fullscreenshot" ''
    ${prev.grim}/bin/grim - -t png | ${prev.wl-clipboard}/bin/wl-copy -t image/png && ${prev.libnotify}/bin/notify-send -a "Full Screen Captured" "Copied to clipboard" -t 888
  '';
  volume = prev.writeShellScriptBin "volume" ''
    #!/bin/sh

    ${prev.pamixer}/bin/pamixer "$@"
    volume="$(${prev.pamixer}/bin/pamixer --get-volume-human)"

    if [ $volume = "muted" ]; then
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "Volume" \
            "Muted" \
            -t 888 \
            -u low
    else
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "Volume" "Currently at $volume" \
            -h int:value:"$volume" \
            -t 888 \
            -u low
    fi
  '';
  microphone = prev.writeShellScriptBin "microphone" ''
    #!/bin/sh

    ${prev.pamixer}/bin/pamixer --default-source "$@"
    mic="$(${prev.pamixer}/bin/pamixer --default-source --get-volume-human)"

    if [ "$mic" = "muted" ]; then
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "Microphone" \
            "Muted" \
            -t 888 \
            -u low
    else
      ${prev.libnotify}/bin/notify-send -r 69 \
            -a "Microphone" "Currently at $mic" \
            -h int:value:"$mic" \
            -t 888 \
            -u low
    fi
  '';
  brightness = let brightnessctl = prev.brightnessctl + "/bin/brightnessctl";
  in prev.writeShellScriptBin "brightness" ''
    #!/bin/sh

    ${brightnessctl} "$@"
    brightness=$(echo $(($(${brightnessctl} g) * 100 / $(${brightnessctl} m))))

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "Brightness" "Currently at $brightness%" \
        -h int:value:"$brightness" \
        -t 888 \
        -u low
  '';
  kbdbrightness = let brightnessctl = prev.brightnessctl + "/bin/brightnessctl";
  in prev.writeShellScriptBin "kbdbrightness" ''
    #!/bin/sh

    ${brightnessctl} "$@" --device='kbd_backlight'
    brightness=$(echo $(($(${brightnessctl} --device='kbd_backlight' g) * 100 / $(${brightnessctl} --device='kbd_backlight' m))))

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "Keyboard Brightness" "Currently at $brightness%" \
        -h int:value:"$brightness" \
        -t 888 \
        -u low
  '';
  notifystatus = prev.writeShellScriptBin "notifystatus" ''
    #!/bin/sh

    battery=$(echo "$(cat /sys/class/power_supply/macsmc-battery/capacity)%")
    if [ $(cat /sys/class/power_supply/macsmc-battery/status) = 'Charging' ]; then
      battery_status='(Charging)'
    fi

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "$(date +'%A, %d %B %H:%M')" "Battery at $battery $battery_status" \
        -h int:value:"$battery" \
        -t 888 \
        -u low
  '';
}
