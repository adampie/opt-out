{
  name = "gatsby";
  meta = {
    description = "Gatsby static site generator";
    homepage = "https://github.com/gatsbyjs/gatsby";
    documentation = "https://www.gatsbyjs.com/docs/telemetry";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    GATSBY_TELEMETRY_DISABLED = "1";
  };
  commands = {
    disable = "gatsby telemetry --disable";
    status = "gatsby telemetry";
  };
}
