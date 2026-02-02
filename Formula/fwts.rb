class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/c7/c8/e71f8d8e5be60004cb3b1762431f0d2c06c7f1a9b582e5a98506f8feeae1/fwts-0.1.28.tar.gz"
  sha256 "6c8526a46eda6f6b1d1c3f4638a52d5f4e892aeae542aee9625839dd8a3e8cb0"
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
