{
  name = "localstack";
  meta = {
    description = "LocalStack local AWS cloud emulator";
    homepage = "https://github.com/localstack/localstack";
    documentation = "https://docs.localstack.cloud/references/usage-tracking/";
  };
  variables = {
    DISABLE_EVENTS = "1";
  };
}
