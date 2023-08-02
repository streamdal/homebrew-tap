class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/streamdal/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.2/plumber-darwin-arm64"
      sha256 "1ef79afe693ce5946755d75cfe72a2218256586c92f44d6dd0a6430c1a83186e"
    else
      url "https://github.com/streamdal/plumber/releases/download/v2.5.2/plumber-darwin"
      sha256 "a8c7e45eaf75d1459ad86175e73752b7328363a4b1e004c053a3b892042fa203"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.2/plumber-linux"
      sha256 "b972807655ef4726912960b0d13b9eecba7432bb73672e3b5fdc2fb3ed38abe1"
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
