
class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.2/streamdal-darwin-arm64"
      sha256 "207f60bc8ffb7bb4276fd3b9f5eccfda6fa2952ab5566a3cc4efdbe589db21f4"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.2/streamdal-darwin"
      sha256 "5e55f3b654cfe7af974a33403628b19c3e0b13273b772ff06523ddafe65f202c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.2/streamdal-linux"
      sha256 "00a5b283133aaeae9593f05b10ed2c8e662ef06126158a570f9040d338527e69"
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
