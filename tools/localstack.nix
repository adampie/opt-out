{
  name = "localstack";
  meta = {
    description = "LocalStack local AWS cloud emulator";
    homepage = "https://github.com/localstack/localstack";
    documentation = "https://docs.localstack.cloud/references/usage-tracking/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    DISABLE_EVENTS = "1";
  };
  commands = { };
  config = { };
}
