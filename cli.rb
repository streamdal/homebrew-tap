
class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.4/streamdal-darwin-arm64"
      sha256 "97d32778646b6e70e64dd17861588936fff3b9833f2076373d3805b6935b18be"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.4/streamdal-darwin"
      sha256 "4a983d74af4d83be200cb7d891bf2cf0d8b7a9109674d1b11c7f7e36ab5141b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.4/streamdal-linux"
      sha256 "b54f71e3198b24bee4d989d681391f24289e60353ca4dfa1e7a199101b1235ca"
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
