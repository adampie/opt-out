{
  name = "nuxtjs";
  meta = {
    description = "Nuxt Vue.js framework";
    homepage = "https://github.com/nuxt/telemetry";
    documentation = "https://v2.nuxt.com/docs/configuration-glossary/configuration-telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    NUXT_TELEMETRY_DISABLED = "1";
  };
  commands = {
    status = "npx nuxt telemetry status";
  };
}
