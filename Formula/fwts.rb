class Fwts < Formula
  include Language::Python::Virtualenv

  desc "Git worktree workflow manager for feature development"
  homepage "https://github.com/laudiacay/featurebox"
  url "https://files.pythonhosted.org/packages/source/f/fwts/fwts-0.1.0.tar.gz"
  sha256 "fcbf6b044bc42daf7ca8acdfd3d8e38b21b3015503044735a232a782a7cca91c"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/fwts", "--version"
  end
end
