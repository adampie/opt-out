{
  name = "devpod";
  meta = {
    description = "DevPod open-source dev environments";
    homepage = "https://github.com/loft-sh/devpod";
    documentation = "https://devpod.sh/docs/other-topics/telemetry";
    lastChecked = "2026-02-22";
  };
  variables = {
    DEVPOD_DISABLE_TELEMETRY = "true";
  };
  commands = {
    status = "devpod context options";
  };
}
