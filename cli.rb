
class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.3/streamdal-darwin-arm64"
      sha256 "7255ea8439ea1e6350a0824c0aa57c8cc39d0ab40592cb34a93edb1502ab822d"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.3/streamdal-darwin"
      sha256 "cd212659c278f48bfb2277b7419cb27acca961a901626812a4ee9c534efe4687"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps/cli/v0.0.3/streamdal-linux"
      sha256 "76528be8a487f71b6fd3d6ffb3fb5ecb3065327b37ecd1ca1ce19f1a5ed79479"
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
