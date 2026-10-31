# Generated with JReleaser 1.27.0 at 2026-10-31T18:21:43.057455728Z
# Custom JGen formula: JReleaser's java-binary template plus the man page and shell completions.

class Jgen < Formula
  desc "Blueprint-driven code generator for Chenile, and for anything else that is text"
  homepage "https://jgen.chenile.org"
  url "https://github.com/rajakolluru/chenile-gen/releases/download/2.1.35/jgen-2.1.35.zip"
  version "2.1.35"
  sha256 "a6f92cda12c70a34f680dfe42b1798f8113f36a76086719f3f452842f3da6d5b"
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
    assert_match "2.1.35", output
  end
end
