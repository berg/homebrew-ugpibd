class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.6.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.6.0/ugpibd-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "a3f1525b2f38b943b51449cfcec5bd23b2bd4bc1ec5343338cfb0dae07edbb73"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.6.0/ugpibd-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "8cba61bea6fba671625ca9f4896fecdc4da7d22ceb63e9bfa0a64e8152af0f61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.6.0/ugpibd-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f86332fc41048932a8df8835deedc1cac9a059f23df329f1b91dec1087e1d72e"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.6.0/ugpibd-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fcf7788913c3a9f9f6ef585f47cda78b5ed7f9de5f1907b55377a30eab9e865"
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
