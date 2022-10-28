class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.2/plumber-darwin-arm64"
      sha256 "2901d83f402c74d5ad2a7403b270791b78da7fd7fbf5dc7e04c01d8069c0293f"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.2/plumber-darwin"
      sha256 "dc4a54f844da4d2dc5bbcfe916a4b0bf984b0bedb14756b114eef950b0206d5d"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.2/plumber-linux"
      sha256 "94ec2777d008c736d611c70a9e0b91a231c5e58143cf62748de7d9afc85691f3"
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
