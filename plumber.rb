class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.3/plumber-darwin-arm64"
      sha256 "f1eeaa935265a8e1e76b5a7c0d0f90713fc3e5c66ed31ff5e674e95b199ea480"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.3/plumber-darwin"
      sha256 "8b346b7d14b9132045f1b97023225e396a7ef206f68426d5bb7445826bafc677"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.3/plumber-linux"
      sha256 "55a364e7cdc9903ee5b81a490c6d736ee0a98955285eedfb8412e976efd8d801"
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
