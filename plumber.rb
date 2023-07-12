class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/streamdal/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.1/plumber-darwin-arm64"
      sha256 "fffb5f6a2c62821c55f66f68c52178924758f20629c16e1290daed18fde49a0c"
    else
      url "https://github.com/streamdal/plumber/releases/download/v2.5.1/plumber-darwin"
      sha256 "a9dc41503496e47ba4007f15085f5fd9c5435bb73ed07cc38fb9d8c1ef0a9c61"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.1/plumber-linux"
      sha256 "e11dd1f4e4f81f31f8c3f962f069cccf27e6dd8066ffc6f320bbf994be1ac8b2"
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
