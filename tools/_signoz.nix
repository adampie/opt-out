{
  name = "signoz";
  meta = {
    description = "SigNoz open-source observability platform";
    homepage = "https://github.com/SigNoz/signoz";
    documentation = "https://signoz.io/docs/telemetry/";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "statsreporter" = {
      "enabled" = "false";
    };
  };
}
