# Nix(OS) dotfiles for macOS/Asahi Linux

## Installing on NixOS

Follow [nixos-apple-silicon guide](https://github.com/tpwrules/nixos-apple-silicon/tree/main/docs/uefi-standalone.md)

```bash
sudo nixos-rebuild boot --flake .#yuki
reboot
```

## Installing on macOS

Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Build the dotfiles

```bash
nix build ~/.dotfiles\#darwinConfigurations.tishka.system --extra-experimental-features nix-command --extra-experimental-features flakes
./result/sw/bin/darwin-rebuild switch --flake .#tishka
```

(note, `--extra-experimental-features` is only needed the first time around. After that the configuration will edit `/etc/nix/nix.conf` to enable flakes and nix-command by default)

## Thanks

- [thanhvule0310/dotfiles](https://github.com/thanhvule0310/dotfiles)
- [shaunsingh/nix-darwin-dotfiles](https://github.com/shaunsingh/nix-darwin-dotfiles)
