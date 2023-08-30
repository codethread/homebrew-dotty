require "language/go"

class Dotty < Formula
  desc "dotfiles manager"
  homepage "https://github.com/codethread/dotty"
  url "https://github.com/codethread/dotty/archive/refs/tags/v1.0.12.tar.gz"
  sha256 "768810f0e4f07ade3235f96394fcddc62441c27b3dc13ba6831db12d0b51e002"

  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/miguelmota/cointop"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/dotty"
    end
  end

  test do
    system "true"
  end
end
