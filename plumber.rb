class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.3.0/plumber-darwin-arm64"
      sha256 "e4b9c0a74df9d486d025cdeeb7498837056a783aeaeee9b3cf95d2774dc21b2c"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.3.0/plumber-darwin"
      sha256 "4a347e647611d3a35c5ef2e91062d448df878405706712552de32683606c2ce9"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.3.0/plumber-linux"
      sha256 "a370cf9b591667093be1aedd61a96df8db9c841a18c5b3cb5a651f3200b139ed"
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
