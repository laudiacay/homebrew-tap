class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/0a/fc/1a3bc68b464b1a2a0488c8862cea616ce7fae314710b3438b47f2f7a956a/fwts-0.1.6.tar.gz"
  sha256 "cc0a3b829e609905d491b3121006654aa9d110a68445c1dbca496794204ecf37"
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
