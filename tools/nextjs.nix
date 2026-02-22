{
  name = "nextjs";
  meta = {
    description = "Next.js React framework";
    homepage = "https://github.com/vercel/next.js";
    documentation = "https://nextjs.org/telemetry";
    lastChecked = "2026-02-22";
  };
  variables = {
    NEXT_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "next telemetry status";
  };
}
