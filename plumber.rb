class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.4/plumber-darwin-arm64"
      sha256 "3997dc3bb46a82ec2833fbe2204980849e8127d020e5f1aa58015ee14dc5a2f3"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.4/plumber-darwin"
      sha256 "1e5a392d02e2b0698fdbe70dcfd869ebadcaa5cdc7570431328b2adfa5445eea"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v1.14.4/plumber-linux"
      sha256 "9576c70aaeec6d6b4aef6a1031c460917623b80e4e13d72c7117c3b7d7aa819b"
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
