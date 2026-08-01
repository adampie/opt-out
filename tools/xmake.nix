{
  name = "xmake";
  meta = {
    description = "XMake cross-platform build utility";
    homepage = "https://github.com/xmake-io/xmake";
    documentation = "https://xmake.io/guide/extras/environment-variables.html";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    XMAKE_STATS = "false";
  };
  commands = {
    status = "xmake show -l envs";
  };
  config = { };
}
