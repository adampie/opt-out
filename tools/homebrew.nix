{
  name = "homebrew";
  meta = {
    description = "macOS and Linux package manager";
    homepage = "https://github.com/Homebrew/brew";
    documentation = "https://docs.brew.sh/Analytics";
  };
  variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };
}
