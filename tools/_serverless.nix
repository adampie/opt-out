{
  name = "serverless";
  meta = {
    description = "Serverless Framework for building serverless applications";
    homepage = "https://github.com/serverless/serverless";
    documentation = "https://www.serverless.com/legal/privacy";
    lastChecked = "2026-08-01";
    # v3 honoured SLS_TELEMETRY_DISABLED; v4 dropped it and keys the event
    # publisher to the licence instead. Catalogues still listing the variable are
    # downstream of the v3 docs, surviving only at tag v3.40.0 docs/telemetry.md.
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = { };
}
