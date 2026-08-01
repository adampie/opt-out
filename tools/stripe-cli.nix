{
  name = "stripe-cli";
  meta = {
    description = "Stripe command line interface for payment integration";
    homepage = "https://github.com/stripe/stripe-cli";
    documentation = "https://github.com/stripe/stripe-cli";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    STRIPE_CLI_TELEMETRY_OPTOUT = "1";
  };
  commands = { };
  config = { };
}
