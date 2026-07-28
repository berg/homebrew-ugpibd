class Ugpibd < Formula
  desc "Userspace daemon for USB-GPIB adapters (Prologix + HiSLIP TCP front-ends)"
  homepage "https://github.com/berg/ugpibd"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.1/ugpibd-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "41489dfe3123996f687378b761d870b52edc7bde2c825f20188a7db3b4f54de4"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.1/ugpibd-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "b3ecd67056dbdd004f169e3f0e69510ff7d6fd25d5da04ef01bfe86fc4f5e971"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.1/ugpibd-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "660081e7db99901ef4b9fc0707bfc31e59511f681ef6cbdf858df8516c64e524"
    end
    on_arm do
      url "https://github.com/berg/ugpibd/releases/download/v0.3.1/ugpibd-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6835f3d731107c690b7987228100680fb182cc800060b7b84301fe5a3c2d7910"
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
