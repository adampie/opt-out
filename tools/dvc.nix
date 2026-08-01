{
  name = "dvc";
  meta = {
    description = "DVC data version control for ML projects";
    homepage = "https://github.com/iterative/dvc";
    documentation = "https://doc.dvc.org/user-guide/analytics";
    lastChecked = "2026-08-01";
    hasTelemetry = true;
  };
  variables = {
    DVC_NO_ANALYTICS = "true";
  };
  commands = {
    disable = "dvc config core.analytics false";
    status = "dvc config core.analytics";
  };
  config = { };
}
