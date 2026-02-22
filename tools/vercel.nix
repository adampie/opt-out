{
  name = "vercel";
  meta = {
    description = "Vercel CLI";
    homepage = "https://github.com/vercel/vercel";
    documentation = "https://vercel.com/docs/cli/about-telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    VERCEL_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "vercel telemetry status";
  };
}
