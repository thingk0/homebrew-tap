class Macbay < Formula
  desc "Developer-first macOS storage externalizer for Apple Silicon"
  homepage "https://github.com/thingk0/macbay"
  url "https://github.com/thingk0/macbay/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "0d68c954e2cfc1486baec0ff7f5b8d5b040e739d867756b5d0a371c70f67bc5e"
  license "MIT"
  head "https://github.com/thingk0/macbay.git", branch: "develop"

  depends_on xcode: ["15.0", :build]
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mb"
    bin.install_symlink "mb" => "macbay"
  end

  test do
    if build.head?
      assert_match(/\d+\.\d+\.\d+(-dev)?/, shell_output("#{bin}/mb --version"))
      assert_match(/\d+\.\d+\.\d+(-dev)?/, shell_output("#{bin}/macbay --version"))
    else
      assert_match "1.8.0", shell_output("#{bin}/mb --version")
      assert_match "1.8.0", shell_output("#{bin}/macbay --version")
    end
    assert_match "status", shell_output("#{bin}/mb --help")
  end
end
