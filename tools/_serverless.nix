{
  name = "serverless";
  meta = {
    description = "Serverless Framework for building serverless applications";
    homepage = "https://github.com/serverless/serverless";
    documentation = "https://www.serverless.com/legal/privacy";
    lastChecked = "2026-08-01";
    # v3 honoured SLS_TELEMETRY_DISABLED; v4 removed it. The variable appears
    # nowhere in the shipped sf-core bundle, `slstats --disable` errors as
    # deprecated, and the event publisher is keyed to the licence rather than
    # gated on any environment check. Third-party catalogues still list the
    # variable because they are downstream of the v3 docs, which survive only at
    # https://github.com/serverless/serverless/blob/v3.40.0/docs/telemetry.md
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = { };
}
