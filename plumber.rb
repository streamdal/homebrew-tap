class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/streamdal/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.0/plumber-darwin-arm64"
      sha256 "53785ac7d4e9d40238e7224bbaa0461715f38f830fa7bc6bb582f81431dc55cb"
    else
      url "https://github.com/streamdal/plumber/releases/download/v2.5.0/plumber-darwin"
      sha256 "0eee4547663293218a4b43d5e5f815a3a07574af2869d8880b05753e3434fcda"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/plumber/releases/download/v2.5.0/plumber-linux"
      sha256 "f916e83d93517bf3d24bbbd6498aa85b60c6cbdfc809525d2b30ef850c685dda"
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
