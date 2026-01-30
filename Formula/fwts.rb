class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/fb/3a/4b9426e74259a69c93a779c8a94b4e3e8df95157b598ab1cc02f5510ebcb/fwts-0.1.11.tar.gz"
  sha256 "370ea4e74b36d73f71b7a9b1cc9ec2ba3e0fc6b3959a4095fa70df77f58533ea"
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
