{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Desktop
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:11:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:6:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:11:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:6:1.0-event-kbd"

          # Laptop
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          ;; Physical layout of your keyboard
          (defsrc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft IntlBackslash z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt
          )

          (defalias
            ;; layers
            NAV       (layer-while-held nav)
            NUM       (layer-while-held num)
            NAV_SPC   (tap-hold 150 150 spc @NAV)
            NUM_N      (tap-hold 150 150 n @NUM)
            NUM_V      (tap-hold 150 150 v @NUM)

            ;; AltGr mods
            HM_A     (tap-hold 150 150 a ralt)
            HM_DIA      (tap-hold 150 150 ] ralt)

            ;; Lshft mods
            HM_S      (tap-hold 150 150 s lsft)
            HM_L      (tap-hold 150 150 l rsft)
            HM_RIGHT  (tap-hold 150 150 right rsft)

            ;; Lctrl mods
            HM_D      (tap-hold 150 150 d lctrl)
            HM_K      (tap-hold 150 150 k rctrl)
            HM_UP     (tap-hold 150 150 up rctrl)

            ;; Lalt mods
            HM_F      (tap-hold 150 150 f lalt)
            HM_J      (tap-hold 150 150 j lalt)
            HM_DOWN   (tap-hold 150 150 down lalt)

            WSP1      (tap-hold 150 150 (multi lmet 1) ralt)
            WSP2      (tap-hold 150 150 (multi lmet 2) lsft)
            WSP3      (tap-hold 150 150 (multi lmet 3) lctrl)
            WSP4      (tap-hold 150 150 (multi lmet 4) lalt)

            WSP5      (multi lmet 5)

            WSP6      (multi lmet 6)
            WSP7      (multi lmet 7)
            WSP8      (multi lmet 8)
            WSP9      (multi lmet 9)
            WSP0      (multi lmet 0)

            WNDL      (multi lmet h)
            WNDR      (multi lmet l)
            WNDU      (multi lmet k)
            WNDD      (multi lmet j)

            ;; Nav layer
            TERMINAL  (multi lmet ret)
            CLOSE     (multi lmet w)
            BROWSER   (multi lmet b)

            AE '
            OE ;
            AA [
           
            ;; Symbols in number-layer
            grv (multi lsft grave)    ;; `
            exp (multi ralt grave)    ;; ^
            tld (multi ralt lsft grave)    ;; ~
            exc S-1    ;; !
            qot S-2    ;; "
            sqt Backslash ;; '
            hsh S-3    ;; #
            pct S-5    ;; %
            amp S-6    ;; &
            fsh S-7    ;; /
            eq  (tap-hold 150 150 S-0 ralt)    ;; =
            lt  (tap-hold 150 150 IntlBackslash lsft) ;; <
            pl  (tap-hold 150 150 S-8 lctrl)   ;; (
            pr  (tap-hold 150 150 S-9 lalt)    ;; )
            bkl (multi ralt 8)    ;; [
            bkr (multi ralt 9)    ;; ]
            bcl (multi ralt 7)    ;; {
            bcr (multi ralt 0)    ;; }
            bsh =      ;; \
            bar grave  ;; |
            dlr (multi ralt 4)    ;; $
            at  (multi ralt 2)    ;; @
            fur (tap-hold 150 150 4 lalt)
            fve (tap-hold 150 150 5 lctrl)
            six (tap-hold 150 150 6 lsft)
            pls (tap-hold 150 150 Minus ralt)
          )

          (deflayer home
            esc  _     _     _     _     _        _     _     _     _     _      Backspace   _
            tab  @HM_A @HM_S @HM_D @HM_F _        _     @HM_J @HM_K @HM_L @HM_DIA ret   _
            caps _ _     _     _     @NUM_V _           @NUM_N _     _     _     _       _
            _    _    @NAV         @NAV_SPC             _
          )

          (deflayer num
            _   @fsh @at  @bcl @bcr @AA      @bar 7    8    9    @bsh _ _
            _   @eq  @lt  @pl  @pr  @OE      @sqt @fur @fve @six @pls _ _
            _ _ @qot @dlr @bkl @bkr @AE      0    1    2    3    /    _
            _ _ _                        _   _
          )

          (deflayer nav
            _       _     @CLOSE _     _     _             _     home  end   _     _    _ _
            _       @WSP1 @WSP2  @WSP3 @WSP4 @WSP5         left  down  up    right lalt _ @TERMINAL
            _ @WSP6 @WSP7 @WSP8  @WSP9 @WSP0 @BROWSER      @WNDL @WNDD @WNDU @WNDL _    _
            _ _ _         (multi lmet spc)                _
          )
        '';
      };
    };
  };
}
