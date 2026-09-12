class Macbay < Formula
  desc "Developer-first macOS storage externalizer for Apple Silicon"
  homepage "https://github.com/thingk0/macbay"
  url "https://github.com/thingk0/macbay/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3658ad13b20d740e4cee6b93fd40707a8b0b217285c8374d89e9407b0b478020"
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
    assert_match "1.3.0", shell_output("#{bin}/mb --version")
    assert_match "1.3.0", shell_output("#{bin}/macbay --version")
    assert_match "status", shell_output("#{bin}/mb --help")
  end
end
