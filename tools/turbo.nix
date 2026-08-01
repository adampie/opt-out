{
  name = "turbo";
  meta = {
    description = "Turborepo monorepo build tool";
    homepage = "https://github.com/vercel/turbo";
    documentation = "https://turborepo.dev/docs/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    TURBO_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "turbo telemetry status";
  };
  config = { };
}
