{
  name = "turbo";
  meta = {
    description = "Turborepo monorepo build tool";
    homepage = "https://github.com/vercel/turbo";
    documentation = "https://turbo.build/repo/docs/telemetry";
    lastChecked = "2026-02-22";
  };
  variables = {
    TURBO_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "turbo telemetry status";
  };
}
