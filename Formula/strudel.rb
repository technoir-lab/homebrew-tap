class Strudel < Formula
  desc "Build, sign, notarize, and package macOS Swift apps"
  homepage "https://github.com/octavore/strudel"
  url "https://github.com/octavore/strudel/releases/download/v0.5.1/strudel-v0.5.1-aarch64-apple-darwin.tar.gz"
  sha256 "3e4ad6c8b49d0cbc5b17c1f60e7a57375408c3b72ab0b643a720d52ceab02ca4"
  license "Apache-2.0"

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
