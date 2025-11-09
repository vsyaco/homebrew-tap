class Phpfmt < Formula
  desc "Zsh wrapper around phpcbf (PSR-12) to format/fix PHP files"
  homepage "https://github.com/vsyaco/phpfmt"
  url "https://github.com/vsyaco/phpfmt/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "6243840e6e41b98d520c69b719976f7cc9e0d19ba5d98b27ff287affe77e540b"
  license "MIT"

  head "https://github.com/vsyaco/phpfmt.git", branch: "main"

  # Tools typically present on PHP dev machines
  depends_on "php" => :recommended
  depends_on "composer" => :recommended

  def install
    # When installing from a tarball or HEAD, the script must be at repo root as `phpfmt`
    bin.install "phpfmt"
  end

  def caveats
    <<~EOS
      phpcbf is required and is distributed via Composer:
        composer global require squizlabs/php_codesniffer
    EOS
  end

  test do
    # With no git repo and no PHP files, the script should exit cleanly and print this message.
    output = shell_output("#{bin}/phpfmt")
    assert_match "No PHP files to format.", output
  end
end


