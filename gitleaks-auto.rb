class GitleaksAuto < Formula
  desc "Install Gitleaks globally with Git pre-commit hook"
  homepage "https://github.com/anhducmata/gitleaks-auto"
  url "https://github.com/anhducmata/gitleaks-auto/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc9656ff9777b03fa0a1d95e776383f34f5fa7f03c96bfb7bb850a899fcf5e04"
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
