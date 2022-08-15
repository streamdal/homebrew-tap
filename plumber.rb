class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.11.0/plumber-darwin-arm64"
      sha256 "d9e5d31a047349b0e15e3868bda307063e83f2570daac7cb242b9a16e03787e6"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.11.0/plumber-darwin"
      sha256 "ab583b6b3b0670c2a126d7b4b421e05cc925f0b43745b14a02d75d40dbac29d0"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.11.0/plumber-linux"
      sha256 "073c4f440fb41ee142be3b2db61aaf2296197515b55faadb2c43a32ac42e2e85"
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
