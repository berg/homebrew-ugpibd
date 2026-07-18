# This file is a template — placeholders are substituted by the release workflow.
# The rendered version lives in https://github.com/berg/homebrew-ugpibd
class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.1.0/ugpibd-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6849dc1c299e99bd0472e54b410037c8ec2fb02ea3f1abb164d5659dc928dae8"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.1.0/ugpibd-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f6f01d3ce7aadc9dea6648f6f0e35d6e3641f850788a9ba3f2004c08ae51c1df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.1.0/ugpibd-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "609501cc418bea210352ae29406ffc29371a72981c427e9461b820e2e12e138b"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.1.0/ugpibd-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c1c3ea071e291cc23c0d801af3ed1cc914b40c4f0ebccf8d99b6d7492f5eb2d"
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
