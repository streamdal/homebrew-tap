class Plumber < Formula
  desc "A swiss army knife Cli tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/streamdal/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/plumber/releases/download/v2.7.1/plumber-darwin-arm64"
      sha256 "96463c9e459c83cdff98fcc358730fea243d07723af17322f3187daafc3dbe79"
    else
      url "https://github.com/streamdal/plumber/releases/download/v2.7.1/plumber-darwin"
      sha256 "e336c972f0b8930eb6fc3656ee6b0f9980c438d6ba558fc2a51bdb2320f61453"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/plumber/releases/download/v2.7.1/plumber-linux"
      sha256 "e0e36552d96646c8bdc8a58d93b8e4fa50134b550635c696769faca5f7d499a2"
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
