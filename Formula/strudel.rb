class Strudel < Formula
  desc "Build, sign, notarize, and package macOS Swift apps"
  homepage "https://github.com/octavore/strudel"
  url "https://github.com/octavore/strudel/releases/download/v0.8.0/strudel-v0.8.0-aarch64-apple-darwin.tar.gz"
  sha256 "66c28d807f9c9399676cd13ba077717c6c2a94f6a7e1b7b035327017930f19e0"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  head do
    url "https://github.com/octavore/strudel.git", branch: "main"
    depends_on "rust" => :build
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "strudel"
    end
  end

  test do
    system bin/"strudel", "--help"
  end
end
