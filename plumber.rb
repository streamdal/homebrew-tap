class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.3/plumber-darwin-arm64"
      sha256 "df3e9f1042b4da45e93067c0c9f2aa9669c3ad00a0865c62e0484e17c5765b89"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.3/plumber-darwin"
      sha256 "aaa1aecb5207ca6e29bf6edce40f56e0b3bfc9789aa6af94ba488a308b4b0d4c"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.3/plumber-linux"
      sha256 "364cc7fa2e19c3f336958e1528e6073f209f451d699edfd44f4be4559aa11209"
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
