class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/m-housh/homebrew-new-tap/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "fcffa756d980a008ec3728bfe54998a505372cdd44cce830e2ab006f7b314ec3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dba7fa11acf159b13b1ca9e398000748bb16381ba0aadc8aeb1f6883107ef34c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
