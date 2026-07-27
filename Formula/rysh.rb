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
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.1/rysh_darwin_amd64.tar.gz"
      sha256 "9df12fb8587239fb1ae819a9f490c44f80d06bdfdcdf63a5726b4be14c6bf040"

      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.1/rysh_darwin_arm64.tar.gz"
      sha256 "66ae6b12be9637568261ddf037ec7214558296bb787462ece7fb722d8545ab4b"

      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.1/rysh_linux_amd64.tar.gz"
      sha256 "4375858e1b0d125738eff2eb7789dd1aa2bbd35731339861912c8440b53fef7e"
      define_method(:install) do
        bin.install "rysh"
        mkdir_p etc/"rysh"
        etc.install "rysh.config.yaml.example" => "rysh/rysh.config.yaml.example"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rysh-ai/rysh-cli-code/releases/download/v0.1.1/rysh_linux_arm64.tar.gz"
      sha256 "808a1b04ba65f27119b8b237dd4f005236e0a21c7d277f63b7c35796b2b625bd"
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
