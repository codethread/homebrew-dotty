require "language/go"

class Dotty < Formula
  desc "dotfiles manager"
  homepage "https://github.com/codethread/dotty"
  url "https://github.com/codethread/dotty/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "b5fe51065153c71688b1450e1df1fede6c8244bd513b0256441999659715f8aa"

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
