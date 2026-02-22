{
  name = "aws-cdk";
  meta = {
    description = "AWS Cloud Development Kit CLI";
    homepage = "https://github.com/aws/aws-cdk";
    documentation = "https://docs.aws.amazon.com/cdk/v2/guide/cli-telemetry.html";
    lastChecked = "2026-02-22";
  };
  variables = {
    CDK_DISABLE_CLI_TELEMETRY = "true";
  };
  commands = {
    status = "cdk cli-telemetry --status";
  };
}
