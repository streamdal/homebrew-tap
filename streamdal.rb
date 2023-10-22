class Streamdal < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/streamdal/streamdal/releases/download/v0.1.0/streamdal-darwin-arm64"
      sha256 "c3bfd88646132cebececa3fcfc0090fc733fbee2f7f52a4465b88b97320c4d56"
    else
      url "https://github.com/streamdal/streamdal/releases/download/v0.1.0/streamdal-darwin"
      sha256 "f16c7b9bf2ca1fc590f6b3a0f64f4a52925062f1aae9eca19ba1a0def01cc50a"
    end
  end

  on_linux do
    if Hardware::CPU::intel?
      url "https://github.com/streamdal/streamdal/releases/download/v0.1.0/streamdal-linux"
      sha256 "d611db24d6ce148474f54d4e49194b74f64a59ba0a40d201a25ea62df341fbd0"
    else
      ohdie "Unsupported CPU architecture"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "streamdal-darwin-arm64" => "streamdal"
      else
        bin.install "streamdal-darwin" => "streamdal"
      end
    end

    on_linux do
      bin.install "streamdal-linux" => "streamdal"
    end
  end

  test do
    system "#{bin}/streamdal --usage"
  end
end
