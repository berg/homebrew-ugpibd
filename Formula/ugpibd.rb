# This file is a template — placeholders are substituted by the release workflow.
# The rendered version lives in https://github.com/berg/homebrew-ugpibd
class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.0/ugpibd-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c842b00fe31b81a677128d84f6e7a31843b8eea3528a626aff42a7f70e1ce43b"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.0/ugpibd-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "847eb862c9b362b59b89fb0b79e33cb9bf4e134ebc813d37cc367c8a685b816d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.0/ugpibd-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3803eb355c900c0222a99be8da79d7470e9fd74f40615402c685b308699e593"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.0/ugpibd-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21ceacbc29274319287cb00219760f98c07a41b1694f037287d6f6b084e4df18"
    end
  end

  def install
    bin.install "ugpibd"
    bin.install "scpi"
  end

  test do
    assert_match "ugpibd", shell_output("#{bin}/ugpibd --help 2>&1")
    assert_match "SCPI", shell_output("#{bin}/scpi --help 2>&1")
  end
end
