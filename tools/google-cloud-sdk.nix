{
  name = "google-cloud-sdk";
  meta = {
    description = "Google Cloud SDK command line tools";
    homepage = "https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk";
    documentation = "https://docs.cloud.google.com/sdk/docs/properties";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    CLOUDSDK_CORE_DISABLE_USAGE_REPORTING = "true";
  };
  commands = { };
  config = { };
}
