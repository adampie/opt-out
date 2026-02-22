{
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
}
