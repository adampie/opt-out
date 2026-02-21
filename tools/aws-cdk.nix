{
  name = "aws-cdk";
  meta = {
    description = "AWS Cloud Development Kit CLI";
    homepage = "https://github.com/aws/aws-cdk";
    documentation = "https://docs.aws.amazon.com/cdk/v2/guide/cli-telemetry.html";
  };
  variables = {
    CDK_DISABLE_CLI_TELEMETRY = "true";
  };
}
