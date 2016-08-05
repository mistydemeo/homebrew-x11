class Xdotool < Formula
  desc "Fake keyboard/mouse input and window management for X"
  homepage "http://www.semicomplete.com/projects/xdotool/"
  url "https://github.com/jordansissel/xdotool/archive/v3.20160804.2.tar.gz"
  sha256 "52b8aa08ff6e2d55c2c9a8eaa3601f210491676f8e637f3669ac84c562fc78c9"

  depends_on "pkg-config" => :build
  depends_on "libxkbcommon"

  depends_on :x11

  def install
    system "make", "PREFIX=#{prefix}", "INSTALLMAN=#{man}", "install"
  end

  def caveats; <<-EOS.undent
    You will probably want to enable XTEST in your X11 server now by running:
      defaults write org.x.X11 enable_test_extensions -boolean true

    For the source of this useful hint:
      http://stackoverflow.com/questions/1264210/does-mac-x11-have-the-xtest-extension
    EOS
  end

  test do
    system "#{bin}/xdotool", "--version"
  end
end
