{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.hyprlock;
in
{
  options.my.hyprlock.enableFingerprint = lib.mkEnableOption ''
    Enable fingerprint authentication for hyprlock via PAM/fprintd
  '';

  config = lib.mkIf cfg.enableFingerprint {
    services.fprintd.enable = true;

    # PAM configuration for hyprlock
    #
    # hyprlock will use the "hyprlock" PAM service by default, so we define it.
    security.pam.services.hyprlock = {
      # optional: allow hyprlock to unlock without a TTY
      # allowNullPassword = false;
      text = ''
        # First try fingerprint
        auth      sufficient   pam_fprintd.so

        # Fallback to normal Unix password
        auth      sufficient   pam_unix.so try_first_pass likeauth nullok

        # Pull in the rest from the login stack
        auth      include      login
        account   include      login
        password  include      login
        session   include      login
      '';
    };
  };
}
