class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    case RbConfig::CONFIG["host_cpu"]
    when "arm64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.0/plumber-darwin-arm64"
      sha256 "37ba2a71633f484d88205d9165f2a0aa5fc79b6e673ab13e7c56ebac2b12fbd2"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.0/plumber-darwin"
      sha256 "a02e864fe20609cca8180069658b6038b3f54ff9df86fbeb2a67f761a7075208"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.7.0/plumber-linux"
      sha256 "4f98eb63617a415a36f89aee63235c86d7fe76607be06a8dcc27a5d1b1c35bb5"
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
