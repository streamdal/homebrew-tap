class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    url "https://github.com/batchcorp/plumber/releases/download/v0.1.0/plumber-darwin"
    sha256 "484250f6bece547c8c88cc5fc07ebc709a1c7f5c7744d7c620b659364058668e"
  elsif OS.linux?

    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v0.1.0/plumber-linux"
      sha256 "8d6bcd96b3959fae7a8d6a05dadd7ca24ab373d219922d8481b7760970628beb"
    else
      ohdie "Architecture not supported by this formula"
    end
  end

  def install
    bin.install "plumber"
  end

  test do
    system "#{bin}/plumber --usage"
  end
end
