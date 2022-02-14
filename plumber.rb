class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    url "https://github.com/batchcorp/plumber/releases/download/v1.3.1/plumber-darwin"
    sha256 "c5cb10b85299cc4a3e3ceb6f64b1fe2e8313b8a26d5f3dc8c9d495913a44674a"
  elsif OS.linux?

    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.3.1/plumber-linux"
      sha256 "bd328a2eafa4b9571d3fcce86c009862e97b14e1c1b7bef0e857863d087dc12a"
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
