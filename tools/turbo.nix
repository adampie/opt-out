{
  name = "turbo";
  meta = {
    description = "Turborepo monorepo build tool";
    homepage = "https://github.com/vercel/turbo";
    documentation = "https://turborepo.dev/repo/docs/telemetry";
    lastChecked = "2026-03-29";
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
