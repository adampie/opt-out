{
  name = "zen-browser";
  meta = {
    description = "Desktop web browser focused on productivity and a calm browsing experience";
    homepage = "https://github.com/zen-browser/desktop";
    documentation = "https://zen-browser.app/privacy-policy/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "about:config" = {
      "datareporting.policy.dataSubmissionEnabled" = "false";
      "datareporting.healthreport.uploadEnabled" = "false";
      "toolkit.telemetry.enabled" = "false";
    };
  };
}
