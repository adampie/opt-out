{
  name = "coder";
  meta = {
    description = "Coder remote development platform";
    homepage = "https://github.com/coder/coder";
    documentation = "https://coder.com/docs/admin/setup/telemetry";
  };
  variables = {
    CODER_TELEMETRY_ENABLE = "false";
  };
}
