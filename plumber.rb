class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  if OS.mac?
    url "https://github.com/batchcorp/plumber/releases/download/v0.25.1/plumber-darwin"
    sha256 "cd2f66af8cbedc1927a7c6b1641a93f65fc874ac41dda88adbcb308fd1fcbd1a44"
  elsif OS.linux?

    case RbConfig::CONFIG["host_cpu"]
    when "x86_64"
      url "https://github.com/batchcorp/plumber/releases/download/v0.25.1/plumber-linux"
      sha256 ".2b10d7632d10453aa09b13791909dedb646cdaf1b38340e5567373abc7a5e830"
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
