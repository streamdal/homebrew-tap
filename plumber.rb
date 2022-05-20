class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  OS.Architecture
  if OS.mac?
    case RbConfig::CONFIG["host_cpu"]
    when "arm64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.1/plumber-darwin-arm64"
      sha256 "2471d66995416b166ee9810ee09a319d54cafb40a607c465ac73c9c8bcdae9c6"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.1/plumber-darwin"
      sha256 "d61dd5296edb47909812621a6c669299b81b510212bcf0d3600969951a32246f"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.1/plumber-linux"
      sha256 "e6d07c69f3330bba113dc7be4fb2e1ccf34a388771e5802833b4c0303873a07f"
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
