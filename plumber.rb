class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.4.0/plumber-darwin-arm64"
      sha256 "22f909efaddb9b62c2c4efd05797dceb233d93ba80e5e8ce4e1dc00b3030b4c9"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.4.0/plumber-darwin"
      sha256 "b3988e1f94ab24137fe57bd0fb926adff623c3ad96f6a2e029bea4618ee2fc0e"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.4.0/plumber-linux"
      sha256 "4f4707390add45326771f028354fc3fd9d9d8da216039fe9cf950710681e8e22"
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
