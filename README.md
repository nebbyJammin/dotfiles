# My Dotfiles

A collection of my dotfiles for zsh, neovim, kitty, hyprland and more.

## Getting Started

### Dependencies

These dotfiles were created on Arch linux using `pacman` and `yay` primarily as package managers.

It is highly recommended that you install the dependencies from pacman and 

TODO: Provide a list of dependencies from `pacman` and `yay`.

Next you may want to install some optional dependencies and configure these packages that require extra configuration:
- [Oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
    - Complete installation via the bash install script.
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
    - Complete installation via the bash install script.
- bob (installed via pacman)
    - Run `bob use nightly` to use nightly neovim
- asdf (installed via pacman)
    - Install `erlang`, `elixir`, `nodejs` and `deno`
- mpd (installed via pacman)
    - Run `mkdir -p` on the Music and Playlists directory, and ensure they exist.
    - Register mpd as a user service using `systemctl --user enable --now mpd`
- rmpc / mpd-yt-autodownloader
    - Download songs using mpd-yt-autodownloader-v2 TODO: Rewrite in python
- keyd (installed via pacman) for overriding keyboard input (probably don't need this for desktop)
    - Create a `/etc/keyd/default.conf` with:
    - ```
      [ids]
      *

      [main]
      capslock = overload(control, esc)
      ```
    - Run `sudo systemctl enable --now keyd`

### Installing

Clone the repo into your home directory, and `cd` into it:

```zsh
cd ~ && \
git clone https://github.com/nebbyJammin/dotfiles && \
cd dotfiles
```

While in the dotfiles directory use `stow` to acquire a configuration file.

```zsh
stow -R <module_name>
```

### Miscellaneous Setup

Some further setup / fixes you may want to do.

#### Docker blocked by systemd-networkd-wait-online.service

```bash
sudo systemctl edit systemd-networkd-wait-online.service
```

Wait for any interfaces to be available, not all of them.

```
[Service]
ExecStart=
ExecStart=/lib/systemd/systemd-networkd-wait-online --any
```

Mark unconnected interfaces as optional in `/etc/systemd/network/20-<interface>.network`.

```
[Link]
RequiredForOnline=no
```
