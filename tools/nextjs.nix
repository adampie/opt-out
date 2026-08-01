{
  name = "nextjs";
  meta = {
    description = "Next.js React framework";
    homepage = "https://github.com/vercel/next.js";
    documentation = "https://nextjs.org/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    NEXT_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "next telemetry status";
  };
  config = { };
}
