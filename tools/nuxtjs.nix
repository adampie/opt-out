{
  name = "nuxtjs";
  meta = {
    description = "Nuxt Vue.js framework";
    homepage = "https://github.com/nuxt/telemetry";
    documentation = "https://github.com/nuxt/telemetry#opting-out";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    NUXT_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "npx @nuxt/telemetry status";
  };
  config = { };
}
