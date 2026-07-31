{
  # CHECKPOINT_DISABLE switches off the whole Checkpoint client, not just its
  # reporting. Checkpoint also carries version information and security
  # bulletins, so setting this gives up upgrade notices and vulnerability
  # alerts across every HashiCorp product on the machine. Kept because it is
  # the only opt-out HashiCorp offers, but it costs more than telemetry alone.
  name = "hashicorp";
  meta = {
    description = "HashiCorp tools (Vagrant, Terraform, Consul, Packer, Nomad)";
    homepage = "https://github.com/hashicorp/go-checkpoint";
    documentation = "https://checkpoint.hashicorp.com";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    CHECKPOINT_DISABLE = "1";
  };
  commands = { };
  config = { };
}
