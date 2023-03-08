class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.3/plumber-darwin-arm64"
      sha256 "e29cef25c4a01d2633ab8f20b1038a327be424c78c2fa487168f25a3519ef156"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.3/plumber-darwin"
      sha256 "b7caf8a331f725cadcb68f9eec81541274a86a61130055ba84519973ce658780"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.3/plumber-linux"
      sha256 "4587c0c30749399ce5412ec907a30a79604b5189be875ea1d1f62104c0353d02"
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
