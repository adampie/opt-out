{
  name = "turbo";
  meta = {
    description = "Turborepo monorepo build tool";
    homepage = "https://github.com/vercel/turbo";
    documentation = "https://turbo.build/repo/docs/telemetry";
  };
  variables = {
    TURBO_TELEMETRY_DISABLED = "1";
  };
}
