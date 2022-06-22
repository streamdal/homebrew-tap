class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.1/plumber-darwin-arm64"
      sha256 "4106fdd9b280182384f1a7fc07e6d09258c4731badfe325ef2817e4d02130874"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.1/plumber-darwin"
      sha256 "7994852f71e9ab5e189722c05d192116f1af2e8c8ae564e4635c206430e93360"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.1/plumber-linux"
      sha256 "db318b08c924fcb51de075529f41defa673237795c34770234e2026b3a4162b1"
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
