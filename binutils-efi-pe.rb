# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class BinutilsEfiPe < Formula
  desc "FSF Binutils for EFI development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftpmirror.gnu.org/binutils/binutils-2.27.tar.gz"
  version "2.27"
  sha256 "26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--program-prefix=x86_64-efi-pe-",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--disable-werror",
                          "--target=x86_64-efi-pe"
    system "make"
    system "make", "install"
end

  test do
    assert_match "main", shell_output("#{bin}/gnm #{bin}/gnm")
  end
end
