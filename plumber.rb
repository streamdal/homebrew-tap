class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.15.0/plumber-darwin-arm64"
      sha256 "42a41174fd4c8c7b3f114220dc455e9851ce7a3cb8580f3b2bce9a371e4c32f6"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.15.0/plumber-darwin"
      sha256 "7192c11069aab3c4ce4b846a4cfdb08df8beb3edc0ebc5a9f5570049779b3892"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.15.0/plumber-linux"
      sha256 "190591a9e28b0a5bedef4fa54eaca12911225c9db525a96f3e7dd6c3473580e5"
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
