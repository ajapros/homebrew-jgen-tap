# Generated with JReleaser 1.27.0 at 2026-11-26T19:02:28.912894533Z
# Custom JGen formula: JReleaser's java-binary template plus the man page and shell completions.

class Jgen < Formula
  desc "Blueprint-driven code generator for Chenile, and for anything else that is text"
  homepage "https://jgen.chenile.org"
  url "https://github.com/rajakolluru/chenile-gen/releases/download/2.5.2/jgen-2.5.2.zip"
  version "2.5.2"
  sha256 "ac752944637d8dd97bb35e48340d68157af4ba2bb11e9248b7d469cbbe16cd77"
  license "MIT"

  depends_on "openjdk@25"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jgen" => "jgen"
    man1.install libexec/"man/man1/jgen.1"
    bash_completion.install libexec/"completions/jgen.bash" => "jgen"
    zsh_completion.install libexec/"completions/_jgen"
    fish_completion.install libexec/"completions/jgen.fish"
  end

  test do
    output = shell_output("#{bin}/jgen --version")
    assert_match "2.5.2", output
  end
end
