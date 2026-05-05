{
  systemd.user.enable = true;

  systemd.user.services.monitor-disable = {
    Unit.description = "Handles laptop monitor disabling/enabling when connected to external display";
    Install.WantedBy = [ "default.target" ];

    Service = {
      Type = "Simple";
      ExecStart = "/home/asmund/.local/bin/monitor_disable";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
