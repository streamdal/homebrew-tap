class Plumber < Formula
  desc "A swiss army knife CLI tool for interacting with Kafka, RabbitMQ and other messaging systems."
  homepage "https://github.com/batchcorp/plumber"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.1/plumber-darwin-arm64"
      sha256 "7cd4246bec50bcbfe28389a3d3f6ec123a791dafcebdd672231f2c9f4cfb6964"
    else
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.1/plumber-darwin"
      sha256 "007e908b088ca0f70f64d1f57790499841210003fc32cc7be935bc85d60810f6"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/batchcorp/plumber/releases/download/v2.1.1/plumber-linux"
      sha256 "921a578837031065ca8092315ec6ea48b5660a1bb3e858beeb212774a83b8fcf"
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
