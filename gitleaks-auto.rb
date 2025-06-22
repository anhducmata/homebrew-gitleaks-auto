class GitleaksAuto < Formula
  desc "Install Gitleaks globally with Git pre-commit hook"
  homepage "https://github.com/anhducmata/gitleaks-auto"
  url "https://github.com/anhducmata/gitleaks-auto/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
