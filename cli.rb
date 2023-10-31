class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/cli/releases/download/v0.1.1/streamdal-darwin-arm64"
      sha256 "24e41925701bf7b26208cdf597284782fdc35dfbedf399f1c665516cda7f6df0"
    else
      url "https://github.com/streamdal/cli/releases/download/v0.1.1/streamdal-darwin"
      sha256 "71291c89e7aaf0536b7cd8310b90f772d1b428a7b17c3aa274699eeefeebe95a"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/cli/releases/download/v0.1.1/streamdal-linux"
      sha256 "9e395c88f132af2aa6fbe6f66f7f5d6d1769a10c815698550af4d02371b762da"
    else
      ohdie "Unsupported CPU architecture"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "streamdal-darwin-arm64" => "streamdal-cli"
      else
        bin.install "streamdal-darwin" => "streamdal-cli"
      end
    end

    on_linux do
      bin.install "streamdal-linux" => "streamdal-cli"
    end
  end

  test do
    system "#{bin}/streamdal-cli --usage"
  end
end
