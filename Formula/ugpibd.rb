class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.4.0/ugpibd-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "6448f8ed2de02fa954a34b50a85e872551ebaabf78c41da858b51ee5dc84e549"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.4.0/ugpibd-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c8fe6d8ba9da38f15b6993108d2e1809227fbc34f57eb94038d6908bde966930"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.4.0/ugpibd-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcdf385c5a142b6de7c3afee350ad0bcb42066336a2a6346f4afaacc9aef6861"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.4.0/ugpibd-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c1fe203d57ee9c9f1aa108e02f977c0d742a84490821b94887db0549963060e"
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
