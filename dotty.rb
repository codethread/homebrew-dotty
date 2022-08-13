require "language/go"

class Dotty < Formula
  desc "dotfiles manager"
  homepage "https://github.com/codethread/dotty"
  url "https://github.com/codethread/dotty/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "530f11af7ad767231255e2019fc060f880cd05cca21a05de5eadedeac15267cb"
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
