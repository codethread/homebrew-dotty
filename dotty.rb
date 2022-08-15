require "language/go"

class Dotty < Formula
  desc "dotfiles manager"
  homepage "https://github.com/codethread/dotty"
  url "https://github.com/codethread/dotty/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "d5e72162d4e224de322782fcce2255defda8080eb62ab56dcee5e6e96826855f"
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
