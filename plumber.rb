class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.1/plumber-darwin-arm64"
      sha256 "662bd8014c3cc8c1b1c2d23d5e5eb35850166dfc11c33285e19461207e00d1e8"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.1/plumber-darwin"
      sha256 "9f225e1a837bc525ea3e7a7f35d15efd76a43ca876599f726c8208478148ee99"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.1/plumber-linux"
      sha256 "ccc4893f2964d150c633c89ffc6450267bd93de17db2870b71cf0f8de38c4d92"
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
