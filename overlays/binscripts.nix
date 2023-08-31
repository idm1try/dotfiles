final: prev: {
  volume = prev.writeShellScriptBin "volume" ''
    #!/bin/sh

    amixer "$@"
    volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
    state="$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))"

    if [ $state = "off" ]; then
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "volume" \
            "Muted" \
            -t 888 \
            -u low
    else
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "volume" "currently at $volume" \
            -h int:value:"$volume" \
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
        -a "brightness" "currently at $brightness%" \
        -h int:value:"$brightness" \
        -t 888 \
        -u low
  '';
}
