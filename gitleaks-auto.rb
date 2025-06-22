class GitleaksAuto < Formula
  desc "Install Gitleaks globally with Git pre-commit hook"
  homepage "https://github.com/anhducmata/gitleaks-auto"
  url "https://github.com/anhducmata/gitleaks-auto/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3b52e71d892c03aff7421f9d4e44fd0ddf1d7939b06bfcfbba267f65f53d8914"
  license "MIT"

  def install
    bin.install "install.sh"
  end

  def post_install
    # Install gitleaks if not present
    unless system("which gitleaks > /dev/null 2>&1")
      system "brew", "install", "gitleaks"
    end

    # Run global hook installer
    system "#{bin}/install.sh"
  end

  test do
    system "gitleaks", "version"
  end
end
