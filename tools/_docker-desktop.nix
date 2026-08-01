{
  name = "docker-desktop";
  meta = {
    description = "One-click-install application for building, sharing, and running containerised applications";
    homepage = "https://www.docker.com/products/docker-desktop/";
    documentation = "https://docs.docker.com/enterprise/security/hardened-desktop/settings-management/settings-reference/";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = { };
  commands = { };
  config = {
    "~/Library/Group Containers/group.com.docker/settings-store.json" = {
      "analyticsEnabled" = "false";
    };
    "~/.docker/desktop/settings-store.json" = {
      "analyticsEnabled" = "false";
    };
  };
}
