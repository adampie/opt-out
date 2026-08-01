{
  name = "wrangler";
  meta = {
    description = "Cloudflare Workers CLI";
    homepage = "https://github.com/cloudflare/workers-sdk";
    documentation = "https://developers.cloudflare.com/workers/wrangler/system-environment-variables/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    WRANGLER_SEND_METRICS = "false";
  };
  commands = {
    status = "npx wrangler telemetry status";
  };
  config = { };
}
