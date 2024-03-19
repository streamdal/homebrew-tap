class Plumber < Formula
  desc "A swiss army knife Cli tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/streamdal/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/plumber/releases/download/v2.6.0/plumber-darwin-arm64"
      sha256 "7c37fabf8adf536f7ba461f78f512821a9b2e74c4148dcc5c0e865ab9381bb28"
    else
      url "https://github.com/streamdal/plumber/releases/download/v2.6.0/plumber-darwin"
      sha256 "a8357959bd7bcc89b10f8d8e2902d4cfd090f2aa73b378c91a64f8d7bf0f6303"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/plumber/releases/download/v2.6.0/plumber-linux"
      sha256 "7ae233d696019e6af10617ee2aec4effdbb6377711be22590b614a3036191ea4"
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
