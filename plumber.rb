class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.2/plumber-darwin-arm64"
      sha256 "88f4e0f07aa5f57bef2e1f3d77c4638596f58f90b2c516a7e3a40ad0c247230a"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.2/plumber-darwin"
      sha256 "15d4d4a9db58e38fc01754e996e70b8ac4bca5e76c579a66f9b30cf5dad2e7f2"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.2/plumber-linux"
      sha256 "4ef71bfe835237b2c8a4570e4f0c4072032d3149834553b7937402ea640cc0d0"
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
