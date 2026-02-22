{
  name = "localstack";
  meta = {
    description = "LocalStack local AWS cloud emulator";
    homepage = "https://github.com/localstack/localstack";
    documentation = "https://docs.localstack.cloud/references/usage-tracking/";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    DISABLE_EVENTS = "1";
  };
  commands = { };
}
