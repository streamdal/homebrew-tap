class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.2/plumber-darwin-arm64"
      sha256 "e6615370d8d70f5f215c68d77d1adb730656e4cfebdb9f744924ca75fee30c55"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.2/plumber-darwin"
      sha256 "d508cb37f431a73e1e9a947b84e1b420730e244da3fbcd02345dc0592517d7d6"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.2/plumber-linux"
      sha256 "6794e569ef0b5f449ef6f681fab38133cf458aa2e7955f8281ccfc6de562d73c"
    else
      ohdie "Unsupported CPU architecture"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "plumber-darwin-arm64" => "plumber"
      else
        bin.install "plumber-darwin" => "plumber"
      end
    end

    on_linux do
      bin.install "plumber-linux" => "plumber"
    end
  end

  test do
    system "#{bin}/plumber --usage"
  end
end
