class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    url "https://github.com/batchcorp/plumber/releases/download/v0.34.0/plumber-darwin"
    sha256 "5cff4a41e79e86272be40fae2c54506211ffc214df48c91ec1891bae319e428f"
  elsif OS.linux?

    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v0.34.0/plumber-linux"
      sha256 "1011bcf37d569b61f1f6e0e75e41fae36a2324b6982a8417dc490ef8b7df4e5f"
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
