# Generated with JReleaser 1.27.0 at 2026-11-26T18:52:07.569270042Z
# Custom stm-cli formula: JReleaser's java-binary template plus the man page and shell completions.

class StmCli < Formula
  desc "Render and inspect Chenile state machine (STM) definitions from the command line"
  homepage "https://github.com/ajapros/stm-cli"
  url "https://github.com/ajapros/stm-cli/releases/download/1.0.1/stm-cli-1.0.1.zip"
  version "1.0.1"
  sha256 "4c182b1d5fe085814ee1d064967d70a15d3094824c2f820253c8571aee47e28b"
  license "MIT"

  depends_on "openjdk@25"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/stm-cli" => "stm-cli"
    man1.install libexec/"man/man1/stm-cli.1"
    bash_completion.install libexec/"completions/stm-cli.bash" => "stm-cli"
    zsh_completion.install libexec/"completions/_stm-cli"
    fish_completion.install libexec/"completions/stm-cli.fish"
  end

  test do
    output = shell_output("#{bin}/stm-cli --version")
    assert_match "1.0.1", output
  end
end
