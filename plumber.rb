class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    case RbConfig::CONFIG["host_cpu"]
    when "arm64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.9.0/plumber-darwin-arm64"
      sha256 "136ff4aa3a07cef84e183f4c8e2c547b1410a60c6309aa2e7c1fe3256223ba93"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v1.9.0/plumber-darwin"
      sha256 "c6e8ca339bf9f746dbf7569869a1357e4ef24da1818fb8dc8e56f61b97121166"
    end
  elsif OS.linux?
    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v1.9.0/plumber-linux"
      sha256 "8dec781b3ba8da159f0eb88f67d596ef8e92e8abac33a1dde8abbe8fa8e8f9bb"
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
