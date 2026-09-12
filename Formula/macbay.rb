class Macbay < Formula
  desc "Developer-first macOS storage externalizer for Apple Silicon"
  homepage "https://github.com/thingk0/macbay"
  url "https://github.com/thingk0/macbay/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "5e05d651a7d1d2e352b66cbc4ab855f83261c7d7e45aee00097dcad414ef5f31"
  license "MIT"
  head "https://github.com/thingk0/macbay.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mb"
    bin.install_symlink "mb" => "macbay"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/mb --version")
    assert_match "1.4.0", shell_output("#{bin}/macbay --version")
    assert_match "status", shell_output("#{bin}/mb --help")
  end
end
