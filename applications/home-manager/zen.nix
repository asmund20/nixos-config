{
  pkgs,
  inputs,
  lib,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;

  zenPackages = inputs.zen-browser.packages.${system};

  # youwen5/zen-browser-flake#22:
  # 1.23.3b was pinned before the release asset was published.
  zenBrowserUnwrapped =
    if zenPackages.zen-browser-unwrapped.version == "1.23.3b" then
      zenPackages.zen-browser-unwrapped.override {
        hash = "sha256-uyBF0+IWVNQP6EElAJLurf0sH8gx7vtQkiJ3PIvcoUk=";
      }
    else
      zenPackages.zen-browser-unwrapped;

  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
    "zen.view.compact.enable-at-startup" = true;
    "browser.bookmarks.addedImportButton" = false;
    "zen.tabs.vertical.right-side" = true;
  };

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "nordpass-password-management" "nordpassStandalone@nordsecurity.com")
    (extension "youtube-recommended-videos" "myallychou@gmail.com")
  ];

  zenBrowser = pkgs.wrapFirefox zenBrowserUnwrapped {
    extraPrefs = lib.concatLines (
      lib.mapAttrsToList (
        name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
      ) prefs
    );

    extraPolicies = {
      DisableTelemetry = true;

      ExtensionSettings = builtins.listToAttrs extensions;

      SearchEngines = {
        Default = "ddg";

        Add = [
          {
            Name = "nixpkgs packages";
            URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@np";
          }

          {
            Name = "NixOS options";
            URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@no";
          }

          {
            Name = "NixOS Wiki";
            URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            IconURL = "https://wiki.nixos.org/favicon.ico";
            Alias = "@nw";
          }

          {
            Name = "noogle";
            URLTemplate = "https://noogle.dev/q?term={searchTerms}";
            IconURL = "https://noogle.dev/favicon.ico";
            Alias = "@ng";
          }
        ];
      };
    };
  };

in
{
  home.packages = [
    zenBrowser
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };
}
