class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.3/streamdal-darwin-arm64"
      sha256 "ccf47d2500e76ab63726365178fcb2d26789efe58213420616bb1c735bb97b7a"
    else
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.3/streamdal-darwin"
      sha256 "26d770f83d7c0fde03f2ade7616ccbf1cd5bfda439cc5abe38fbf8db4bddaa60"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/streamdal/releases/download/apps%2Fcli%2Fv0.0.3/streamdal-linux"
      sha256 "0a50622dc38a5d84625f3f0e561c470e84d5ab1dd4eca853c94fef2dff03d4c6"
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
