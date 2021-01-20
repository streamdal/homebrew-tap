class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    url "https://github.com/batchcorp/plumber/releases/download/v0.12.1/plumber-darwin"
    sha256 "6c8ce60e85fc92dc4c0ddb4733b5c6c5deae09bf306fb1e36964770e9392d2dc"
  elsif OS.linux?

    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v0.12.1/plumber-linux"
      sha256 "a3bb5e8f6e969e5f8a03d1093c2ea6d11c4739a2c2e33d3fcdbcb2b7b85f613a"
    else
      ohdie "Architecture not supported by this formula"
    end
  else
    ohdie "Unsupported OS"
  end

  def install
    if OS.mac?
      bin.install "plumber-darwin" => "plumber"
    elsif OS.linux?
      bin.install "plumber-linux" => "plumber"
    else
      ohdie "Unsupported OS"
    end
  end

  test do
    system "#{bin}/plumber --usage"
  end
end
