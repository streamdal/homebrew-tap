class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.0/plumber-darwin-arm64"
      sha256 "c862742f91edd941d4ae33d0819514d60aab215c1ec9aef90f3ea1e5be052a00"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.0/plumber-darwin"
      sha256 "0f09795ca0ce66c8fc04d973dd21a37651bb8c1fe958b16522438e3f07ae274c"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.0/plumber-linux"
      sha256 "079af203c507ae535624945848066b12d548b522d4f795e03dcd02278e5cb60a"
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
