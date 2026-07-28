# This file is a template — placeholders are substituted by the release workflow.
# The rendered version lives in https://github.com/berg/homebrew-ugpibd
class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.0/ugpibd-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "1e9b57d9e0e60c5ed0ab26b694197661d709f12f3d7a2e8c53cdb6e7b266cb76"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.0/ugpibd-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb66ed6f9e421ba4c4cb17c2785297ab9dda369b3d50a51132f2c3f2f8600f37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.0/ugpibd-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84215484305290a572092cdf55e2660c6b1ed46d59abb8d7360c73455d3dd3d7"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.0/ugpibd-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3830e20e265964ff7d154798aef4f0b31870c6be5a3aae52690a9eaf8cc5b044"
    end
  end

  def install
    bin.install "ugpibd"
    bin.install "ugpibd-scpi"
  end

  test do
    assert_match "ugpibd", shell_output("#{bin}/ugpibd --help 2>&1")
    assert_match "SCPI", shell_output("#{bin}/ugpibd-scpi --help 2>&1")
  end
end
