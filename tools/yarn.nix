{
  name = "yarn";
  meta = {
    description = "Yarn package manager (Berry v2+)";
    homepage = "https://github.com/yarnpkg/berry";
    documentation = "https://yarnpkg.com/advanced/telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    YARN_ENABLE_TELEMETRY = "0";
  };
  commands = { };
  config = { };
}
