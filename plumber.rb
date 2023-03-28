class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.2.1/plumber-darwin-arm64"
      sha256 "367eac57c08f2d70dbee780b3d0076f9e0dfbb26cef98523191219c4a52cee0e"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.2.1/plumber-darwin"
      sha256 "f28b9531e0ad58d975585b870c0c4a6a1db343f638679a673c86bd4a8d32e64e"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.2.1/plumber-linux"
      sha256 "edc0a5a49e9c7ec2fd29e803ec8a0a4adf78a6ea8db9bd7d682053b6ad7f02f1"
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
