{
  name = "devpod";
  meta = {
    description = "DevPod open-source dev environments";
    homepage = "https://github.com/loft-sh/devpod";
    documentation = "https://devpod.sh/docs/other-topics/telemetry";
  };
  variables = {
    DEVPOD_DISABLE_TELEMETRY = "true";
  };
}
