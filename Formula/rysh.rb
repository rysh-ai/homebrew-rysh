# typed: false
# frozen_string_literal: true

# Hand-written to mirror what GoReleaser emits, so an automated run from
# rysh-cli-code produces a minimal diff. Enabling that needs a HOMEBREW_TAP_TOKEN
# secret on rysh-ai/rysh-cli-code; see the commented brews block at the bottom of
# that repo's .goreleaser.yml.
#
# This is the OPEN-SOURCE build (Apache-2.0), served from GitHub Releases.
# The closed build is the `ry` formula, served from packages.rysh.ai.
class Rysh < Formula
  desc "Agentic terminal multiplexer for code development"
  homepage "https://github.com/rysh-ai/rysh-cli-parent"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.3/rysh_darwin_amd64.tar.gz"
      sha256 "e789e40f45dbad561d5434d84c8b1fc10c971b62432365b65663b75d959a2621"

      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.3/rysh_darwin_arm64.tar.gz"
      sha256 "56b6bd1ca68d55134b58ab14ee9264ec10a8d1bc160d34da1a3ca50857cd4468"

      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.3/rysh_linux_amd64.tar.gz"
      sha256 "cda447e57925f25ea6ca6f97e8127d7f6c6b7ff9dab8ce919d5c1527bdccf41d"
      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.3/rysh_linux_arm64.tar.gz"
      sha256 "8066e5d156094bbfff8bff586c87a86a51aa09e164574e87146366e34c93170b"
      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
  end

  test do
    system "#{bin}/rysh", "--version"
  end
end
