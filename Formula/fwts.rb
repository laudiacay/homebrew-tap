class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/fwts"
  url "https://files.pythonhosted.org/packages/source/f/fwts/fwts-0.1.55.tar.gz"
  sha256 "2ac8ee5dd956587e4823d3f3945b589f135e033f5dd33604124479b0eda5a38a"
  license "MIT"

  depends_on "python@3.11"

  def install
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
  end

  def post_install
    system libexec/"bin/pip", "install", "--upgrade", "fwts==#{version}"
    bin.install_symlink libexec/"bin/fwts"
    bin.install_symlink libexec/"bin/fb"
  end

  test do
    system bin/"fwts", "--help"
  end
end
