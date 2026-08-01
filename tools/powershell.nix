{
  name = "powershell";
  meta = {
    description = "PowerShell cross-platform task automation solution";
    homepage = "https://github.com/PowerShell/PowerShell";
    documentation = "https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_telemetry";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    POWERSHELL_TELEMETRY_OPTOUT = "1";
  };
  commands = { };
  config = { };
}
