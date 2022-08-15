require "language/go"

class Dotty < Formula
  desc "dotfiles manager"
  homepage "https://github.com/codethread/dotty"
  url "https://github.com/codethread/dotty/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "debc3e41ebaba0988a3a1f4d999e10e86dcf39c75be0049d8e642fa690ebd61a"
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
