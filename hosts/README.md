# Adding a new host
1. Copy the generated `hardware-configuration.nix` from the `/etc/nixos` folder into a new folder here.
2. Copy `default.nix` from one of the other hosts (not `common`).
3. Set the networking hostname and whether to enable fingerprint sensor
4. Make any wanted change to default.nix
5. Add the new host to `flake.nix` by copying one of the existing ones and setting the correct folder and the name (should match)
6. Add new files to git and run `sudo nixos-rebuild switch <path-to-project-root>#<host-name>`
7. Add keyboard to kanata by looking at `applications/native/kanata.nix`
