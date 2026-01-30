class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/bd/e6/5fe8581476a6d7bc0d796ef8063df5d2279ed9360576de4bba9290448ced/fwts-0.1.12.tar.gz"
  sha256 "5da6e65850f9d4fda799af25398b12b9d28eb0489a2dbd042e8e0395c4de1213"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create venv with pip
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
  end

  def post_install
    # Install from PyPI after sandbox is lifted
    system libexec/"bin/pip", "install", "--upgrade", "fwts==#{version}"
    # Create symlinks to the installed binaries
    bin.install_symlink libexec/"bin/fwts"
    bin.install_symlink libexec/"bin/fb"
  end

  test do
    system bin/"fwts", "--help"
  end
end
