class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.1/streamdal-darwin-arm64"
      sha256 "f33275df57f580cdc0a14fda5743b166e30c42879c4f9cd631fb7ecf7eb65de4"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.1/streamdal-darwin"
      sha256 "2825d77d5a3fc8cb3e17d004f0064e61bc3e0fed8c3dd93366baad6b08c0ca0b"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.1/streamdal-linux"
      sha256 "b73718fdd2fc03372b5cd6bfd6f780c3ed244de2c2865f4aa22cefd2c33acf38"
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
