{
  name = "hashicorp";
  meta = {
    description = "HashiCorp tools (Vagrant, Terraform, Consul, Packer, Nomad)";
    homepage = "https://github.com/hashicorp/go-checkpoint";
    documentation = "https://checkpoint.hashicorp.com";
  };
  variables = {
    CHECKPOINT_DISABLE = "1";
  };
}
