{
  # CHECKPOINT_DISABLE switches off the whole Checkpoint client, so it also gives
  # up upgrade notices and security bulletins across every HashiCorp product.
  # Kept because it is the only opt-out HashiCorp offers.
  name = "hashicorp";
  meta = {
    description = "HashiCorp tools (Vagrant, Terraform, Consul, Packer, Nomad)";
    homepage = "https://github.com/hashicorp/go-checkpoint";
    documentation = "https://checkpoint.hashicorp.com";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    CHECKPOINT_DISABLE = "1";
  };
  commands = { };
  config = { };
}
