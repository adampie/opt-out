{
  name = "nodejs";
  meta = {
    description = "Node.js JavaScript runtime";
    homepage = "https://github.com/nodejs/node";
    documentation = "https://nodejs.org/api/cli.html";
    lastChecked = "2026-03-14";
    # Node.js core does not collect any telemetry, analytics, or crash reports.
    # This was confirmed by reviewing the CLI documentation and GitHub repository.
    # Note: frameworks built on Node.js (e.g., Next.js, Gatsby) may have their own
    # telemetry, but those are separate tools with their own opt-out mechanisms.
    hasTelemetry = false;
  };
  variables = { };
  commands = { };
}
