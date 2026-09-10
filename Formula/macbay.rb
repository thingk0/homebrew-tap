class Macbay < Formula
  desc "Developer-first macOS storage externalizer for Apple Silicon"
  homepage "https://github.com/thingk0/macbay"
  url "https://github.com/thingk0/macbay/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0308fe9ef1d434ae744542c0c918c0077ad728decf53f48cd35203dbf99fba0d"
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
    assert_match "1.0.0", shell_output("#{bin}/mb --version")
    assert_match "1.0.0", shell_output("#{bin}/macbay --version")
    assert_match "status", shell_output("#{bin}/mb --help")
  end
end
