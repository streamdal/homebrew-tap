class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.13.0/plumber-darwin-arm64"
      sha256 "bc9b31604dd5b9cb7604237220cab2aa71f36ba530bf08e645bc1388a45c0c98"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.13.0/plumber-darwin"
      sha256 "e627e778bd5811b2fcb88c25bce7bbab2e19813762a92d8720e7460599c8585c"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.13.0/plumber-linux"
      sha256 "02b3698a1180180d4c1572ae00d728d13bc58ccaaa39e474b638a674adcf08e7"
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
