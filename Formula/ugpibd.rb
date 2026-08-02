class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.5.0/ugpibd-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "c6f334bd4557284d602dd9bd6d8a96fd9ad538312e2245708325a0fa0ce1f16a"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.5.0/ugpibd-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "43b87b9884ee31d40a361052c5b1f205fe33f2187b4212e8dfa08f38945f310f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.5.0/ugpibd-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "753647af5e4f0c96fd73dfa16c469b006aef468b5c7dd3332b359f7f09eb09ba"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.5.0/ugpibd-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3c93110ce137d6394860571e8f5ed8c17cc0805e8879ccd87f112c9810901ab"
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
