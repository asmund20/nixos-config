{
  config,
  pkgs,
  inputs,
  ...
}:
let
  port = 25565;
in

{
  users.users.asmund.packages = with pkgs; [
    prismlauncher
  ];

  networking.firewall.allowedTCPPorts = [
    port
  ];

  services.minecraft-server = {
    eula = true;
    enable = true;
    declarative = true;
    dataDir = "/var/lib/minecraft";
    whitelist = {
      SuperDuperMari = "577163e4-41a6-4721-8436-e073a60be036";
      aasmund1510 = "f8e4532b-bb6a-4a12-ae90-fbd9cea80b7c";
    };
    serverProperties = {
      "white-list" = true;
      "accepts-transfers" = false;
      "allow-flight" = false;
      "allow-nether" = true;
      "broadcast-console-to-ops" = true;
      "broadcast-rcon-to-ops" = true;
      difficulty = "hard";
      "enable-code-of-conduct" = false;
      "enable-command-block" = false;
      "enable-jmx-monitoring" = false;
      "enable-query" = false;
      "enable-rcon" = false;
      "enable-status" = true;
      "enforce-secure-profile" = true;
      "enforce-whitelist" = true;
      "entity-broadcast-range-percentage" = 100;
      "force-gamemode" = false;
      "function-permission-level" = 2;
      gamemode = "survival";
      "generate-structures" = true;
      hardcore = false;
      "hide-online-players" = false;
      "initial-enabled-packs" = "vanilla";
      "level-name" = "Server2";
      "level-type" = "minecraft\:normal";
      "log-ips" = true;
      "management-server-enabled" = false;
      "max-chained-neighbor-updates" = 1000000;
      "max-players" = 20;
      "max-tick-time" = 60000;
      "max-world-size" = 29999984;
      motd = "A Minecraft Server";
      "network-compression-threshold" = 256;
      "online-mode" = true;
      "op-permission-level" = 4;
      "pause-when-empty-seconds" = 60;
      "player-idle-timeout" = 0;
      "prevent-proxy-connections" = false;
      pvp = true;
      "query.port" = port;
      rate-limit = 0;
      "rcon.port" = 25575;
      region-file-compression = "deflate";
      require-resource-pack = false;
      server-port = 25565;
      simulation-distance = 10;
      spawn-monsters = true;
      spawn-protection = 16;
      status-heartbeat-interval = 0;
      sync-chunk-writes = true;
      text-filtering-version = 0;
      use-native-transport = true;
      view-distance = 10;
    };
  };
}
