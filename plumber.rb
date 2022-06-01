class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  OS.Architecture
  if OS.mac?
    case RbConfig::CONFIG["host_cpu"]
    when "arm64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.8.0/plumber-darwin-arm64"
      sha256 "36076d0ee64776943513daffbcc627a6c3c8abf94d625798bae516dabac9c97a"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.8.0/plumber-darwin"
      sha256 "ab2291896a5577e245f225ee2bfc7b2c2a65b01d56856acd0ff03c8fee44f544"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.8.0/plumber-linux"
      sha256 "384dde7b3245c9235b9fc6d0858ed3696b885205b88c02ff1dc803fdd7b27d42"
    else
      ohdie "Architecture not supported by this formula"
    end
  else
    ohdie "Unsupported OS"
  end

  def install
    if OS.mac?
      case RbConfig::CONFIG["host_cpu"]
      when "arm64"
        bin.install "plumber-darwin-arm64" => "plumber"
      else
        bin.install "plumber-darwin" => "plumber"
      end
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
