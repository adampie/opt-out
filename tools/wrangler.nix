{
  name = "wrangler";
  meta = {
    description = "Cloudflare Workers CLI";
    homepage = "https://github.com/cloudflare/workers-sdk";
    documentation = "https://developers.cloudflare.com/workers/wrangler/system-environment-variables/";
    lastChecked = "2026-02-22";
  };
  variables = {
    WRANGLER_SEND_METRICS = "false";
  };
  commands = {
    status = "npx wrangler telemetry status";
  };
}
