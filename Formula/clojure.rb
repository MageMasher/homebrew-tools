class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.507.tar.gz"
  sha256 "8c057265434d643704da93fdcaaffc09abf4d97c69514ed5ace3054486e212cc"

  devel do
    url "https://download.clojure.org/install/clojure-tools-1.10.1.510.tar.gz"
    sha256 "c6e003f612bdd7f9a9baa6d86deafb2d51b411310077c83c9ed13bc649c13b18"
    version "1.10.1.510"
  end

  bottle :unneeded

  depends_on "rlwrap"

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end
