class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.12.0/plumber-darwin-arm64"
      sha256 "2a3737b3a6c4d004c148d8d0940795e5a3643c2003621cc00837940dae57e859"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.12.0/plumber-darwin"
      sha256 "96361dd5e84d5c87261318b324ab0933c6dd7ec534a17b024d173a1c0c1f9837"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.12.0/plumber-linux"
      sha256 "b1a72dc2d489c9ad66a7b40244923c7a9e01979e6937be848cb152c55a1414dc"
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
