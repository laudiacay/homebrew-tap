class Featurebox < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/source/f/featurebox/featurebox-0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  depends_on "python@3.11"
  depends_on "gh"       # GitHub CLI
  depends_on "fzf"      # Interactive picker
  depends_on "tmux"     # Session management

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/featurebox", "--version"
  end
end
