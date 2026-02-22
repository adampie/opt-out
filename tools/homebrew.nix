{
  name = "homebrew";
  meta = {
    description = "macOS and Linux package manager";
    homepage = "https://github.com/Homebrew/brew";
    documentation = "https://docs.brew.sh/Analytics";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };
  commands = {
    status = "brew analytics";
  };
}
