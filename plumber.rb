class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.4/plumber-darwin-arm64"
      sha256 "ff698b9276c3ad8a86dcd6afd3580a2eb1c472b256eeeb176885f1dc49c364ab"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.4/plumber-darwin"
      sha256 "00e8cf96e8703b8822f631d170a07f7c2c9fe8c11333c646bb010ffb38f90838"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.10.4/plumber-linux"
      sha256 "92c4497733cadb7fce883fa69a0be67166c7a20612915bfd8ee4c882c3adc236"
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
