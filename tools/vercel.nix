{
  name = "vercel";
  meta = {
    description = "Vercel CLI";
    homepage = "https://github.com/vercel/vercel";
    documentation = "https://vercel.com/docs/cli/about-telemetry";
  };
  variables = {
    VERCEL_TELEMETRY_DISABLED = "1";
  };
}
