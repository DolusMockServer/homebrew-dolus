class Dolus < Formula
  desc "A configurable mock server"
  url "https://github.com/DolusMockServer/dolus.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  version "0.0.1"
  
  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/DolusMockServer/dolus"
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", "#{bin}/dolus", "cmd/dolus/main.go"
    end

  end
  
    # Homebrew requires tests.
  # test do
  #   # "2>&1" redirects standard error to stdout. The "2" at the end means "the
  #   # exit code should be 2".
  #   assert_match "dolus --version", shell_output("#{bin}/dolus version 2>&1", 2)
  # end
end
