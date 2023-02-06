class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.0.0/plumber-darwin-arm64"
      sha256 "4ffc242cd4d1e206b902a633b18556b020b87b2ab8f24581597431c89640e54a"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.0.0/plumber-darwin"
      sha256 "298c4e4d83cffbc8e0ca09c031b6880809f5604a1e23a6da97b7059777e49286"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.0.0/plumber-linux"
      sha256 "771a3bf399e95d38154091f426271fdfefbe63bb7588fc647ae40a5a001bb811"
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
