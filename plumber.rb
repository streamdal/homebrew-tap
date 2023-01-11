class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.16.0/plumber-darwin-arm64"
      sha256 "78a3b452f9684affb85a21772bc62079b3c58bf77c97d3d99988d90f7e2dbe35"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.16.0/plumber-darwin"
      sha256 "f57eeff309071308b07d5b259048855f04d7bed5517256d8bc0ee89f818bd717"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.16.0/plumber-linux"
      sha256 "344c95fe0e716a95dc879787bd60246fb92f18b9fde3b063e1b0abff7498fc7f"
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
