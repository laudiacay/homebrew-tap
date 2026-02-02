class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/source/f/fwts/fwts-0.1.29.tar.gz"
  sha256 "2b6be99a265a2e44b0edd977c31a6162f452259e0716d59db64fcc86eb84e0e4"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create venv with pip
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
    bin.install_symlink libexec/"bin/fwts"
    bin.install_symlink libexec/"bin/fb"
  end

  def post_install
    # Install from PyPI after sandbox is lifted
    system libexec/"bin/pip", "install", "--upgrade", "fwts==0.1.29"
  end

  test do
    system bin/"fwts", "--help"
  end
end
