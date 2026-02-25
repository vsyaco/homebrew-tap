class Html2md < Formula
  desc "Convert HTML pages to Markdown from the command line"
  homepage "https://github.com/vsyaco/html2md"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vsyaco/html2md/releases/download/v0.1.0/html2md_darwin_arm64.tar.gz"
      sha256 "3def890ef19bfb6a83aea8137337ebd4b967a06545b16d33974900b7d8a4039d"
    else
      url "https://github.com/vsyaco/html2md/releases/download/v0.1.0/html2md_darwin_amd64.tar.gz"
      sha256 "f8115d5e0c5f88d12b2379755e839f9baf5adb29d6d1e1fafba698c9a92b948e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vsyaco/html2md/releases/download/v0.1.0/html2md_linux_arm64.tar.gz"
      sha256 "ba8c7dfa9692682d3e5b1fedba7e3b416841cafe732312029a2b505e0a8ef02e"
    else
      url "https://github.com/vsyaco/html2md/releases/download/v0.1.0/html2md_linux_amd64.tar.gz"
      sha256 "5c47a8accef2c04f29bc7a73da6c69d92d63d9f1ad81a1c6d52ce89e5a53c82f"
    end
  end

  def install
    bin.install "html2md"
  end

  test do
    system "#{bin}/html2md", "--version"
  end
end
