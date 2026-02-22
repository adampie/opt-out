{
  name = "dvc";
  meta = {
    description = "DVC data version control for ML projects";
    homepage = "https://github.com/iterative/dvc";
    documentation = "https://dvc.org/doc/user-guide/analytics";
    lastChecked = "2026-02-22";
    hasTelemetry = true;
  };
  variables = {
    DVC_NO_ANALYTICS = "true";
  };
  commands = {
    disable = "dvc config core.analytics false";
    status = "dvc config core.analytics";
  };
}
