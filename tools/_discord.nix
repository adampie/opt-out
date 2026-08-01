{
  name = "discord";
  meta = {
    description = "A proprietary voice, video, and text communication platform";
    homepage = "https://discord.com";
    documentation = "https://discord.com/privacy";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "User Settings > Privacy & Safety" = {
      "Limit our ability to use your data to improve our services" = "on";
    };
  };
}
