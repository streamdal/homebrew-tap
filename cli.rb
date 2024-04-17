
class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.6/streamdal-darwin-arm64"
      sha256 "c0a0270b3afd873c8f95efddd84c14a925861235647e1177fd915bdce6167c20"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.6/streamdal-darwin"
      sha256 "0ea75542fd3084035a73cdb6ce798f0050e190a4804c4a2cc4bafda3d5ad515d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.6/streamdal-linux"
      sha256 "a82cd6fb98eb7591131a8f7112912a6df604f04df701bf2ebeca88af8e264326"
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
