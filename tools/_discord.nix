{
  name = "discord";
  meta = {
    description = "A proprietary voice, video, and text communication platform";
    homepage = "https://discord.com";
    documentation = "https://support.discord.com/hc/en-us/articles/21864805694999-Data-Used-to-Improve-Discord";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "User Settings > Data & Privacy" = {
      "Use Data to Improve Discord" = "off";
    };
  };
}
