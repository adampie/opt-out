{
  name = "google-cloud-sdk";
  meta = {
    description = "Google Cloud SDK command line tools";
    homepage = "https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk";
    documentation = "https://cloud.google.com/sdk/docs/properties";
    lastChecked = "2026-03-29";
    hasTelemetry = true;
  };
  variables = {
    CLOUDSDK_CORE_DISABLE_USAGE_REPORTING = "true";
  };
  commands = { };
  config = { };
}
