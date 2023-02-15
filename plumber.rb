class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.0/plumber-darwin-arm64"
      sha256 "59afd5e7a533055b5b44aff96e0b153fedb7e3d2fb72623142643b6783d25e73"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.0/plumber-darwin"
      sha256 "1029fbbe45106dfcf207cca131d63a40abbdacc2cce7c912353ffd81a1de55cc"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.0/plumber-linux"
      sha256 "4cf88f48bc8191a372f555c5721c2cf549fba1260f2b4c420ff57e0ae02fc71e"
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
