class GitleaksAuto < Formula
  desc "Global Git hook installer using Gitleaks"
  homepage "https://github.com/yourname/gitleaks-auto"
  url "https://github.com/yourname/gitleaks-auto/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "<INSERT_SHA256_HASH>"
  license "MIT"

  depends_on "gitleaks"

  def install
    bin.install "install.sh"
  end

  def post_install
    system "#{bin}/install.sh"
  end

  test do
    system "gitleaks", "version"
  end
end
