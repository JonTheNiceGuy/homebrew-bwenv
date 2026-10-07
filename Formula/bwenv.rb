# The url and sha256 lines are updated by the release workflow in
# https://github.com/JonTheNiceGuy/bwenv whenever a new version is tagged.
class Bwenv < Formula
  include Language::Python::Shebang

  desc "Run commands with secrets resolved from op:// and bw:// references in Bitwarden"
  homepage "https://github.com/JonTheNiceGuy/bwenv"
  url "https://github.com/JonTheNiceGuy/bwenv/releases/download/v1.12/bwenv.py"
  sha256 "057fe6040e9aea484c5f98556d39bba5cc2fe193c030b65abb0f58e8c0e4f540"
  license "Unlicense"

  depends_on "bitwarden-cli"
  depends_on "python@3.14"

  def install
    bin.install "bwenv.py" => "bwenv"
    rewrite_shebang detected_python_shebang, bin/"bwenv"
  end

  test do
    assert_match "Bitwarden Environment Variable Processor", shell_output("#{bin}/bwenv --help")
    assert_match "No command specified", shell_output("#{bin}/bwenv run 2>&1", 1)
    # A command with no secret references runs without touching the vault
    assert_equal "hello", shell_output("#{bin}/bwenv --no-sync run -- echo hello").strip
  end
end
