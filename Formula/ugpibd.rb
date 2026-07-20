# This file is a template — placeholders are substituted by the release workflow.
# The rendered version lives in https://github.com/berg/homebrew-ugpibd
class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.2.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.1/ugpibd-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "222ec9de121d777f87209190bdba80f4a82215bdb169ba87b91443396813ffd0"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.1/ugpibd-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "969b2c77c49b612d7b4776d8e9e0c1665df37c39ae20a709a8c225762e5acb99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.1/ugpibd-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fa238ad18d4aa7fa745d1a33310790538ffaf492a4257d555571f18ed2887ca"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.2.1/ugpibd-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb430e9652be9341ebcb7a3ea1756e1b178c31353639002cc640d393f40cef32"
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
