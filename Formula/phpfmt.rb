class Phpfmt < Formula
  desc "Zsh wrapper around phpcbf (PSR-12) to format/fix PHP files"
  homepage "https://github.com/vsyaco/phpfmt"
  url "https://github.com/vsyaco/phpfmt/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "23aa66e0767380831a06143ce47ffe354dc46a45549905ee3850f3036c1f49a2"
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

      Ensure Composer global bin is on PATH, e.g. add to your shell profile:
        export PATH="$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:$PATH"

      Examples:
        phpfmt       # format staged + unstaged (modified & untracked) PHP files
        phpfmt -a    # format all PHP files under current directory (recursively)
        phpfmt -p    # format PHP files changed in the latest commit (HEAD)
    EOS
  end

  test do
    # With no git repo and no PHP files, the script should exit cleanly and print this message.
    output = shell_output("#{bin}/phpfmt")
    assert_match "No PHP files to format.", output
  end
end


