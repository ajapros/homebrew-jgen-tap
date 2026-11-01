# Generated with JReleaser 1.27.0 at 2026-11-01T14:54:34.333834111Z
# Custom JGen formula: JReleaser's java-binary template plus the man page and shell completions.

class Jgen < Formula
  desc "Blueprint-driven code generator for Chenile, and for anything else that is text"
  homepage "https://jgen.chenile.org"
  url "https://github.com/rajakolluru/chenile-gen/releases/download/2.5.1/jgen-2.5.1.zip"
  version "2.5.1"
  sha256 "789ab226a5ffc4a5808f811c720f71c99de14a122fa0693d2d54ee17b6ae5b1b"
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
    assert_match "2.5.1", output
  end
end
