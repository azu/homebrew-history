class History < Formula
  homepage 'https://github.com/b4b4r07/history'
  version '0.0.1'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/b4b4r07/history/releases/download/0.0.1/history-0.0.1-darwin-amd64.tar.gz'
    sha256 'b8b72b91978df3f1b2f5177ad8ce0194ab096c5d9c7acdfd4c26fcd25ab1ca47'
  else
    url 'https://github.com/b4b4r07/history/releases/download/0.0.1/history-0.0.1-darwin-386.tar.gz'
    sha256 '9a71555b8288164469dcdcde4260ff4c247d885f695e44a6b068e9005653cd9d'
  end

  head do
    url 'https://github.com/b4b4r07/history.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
    depends_on 'mercurial' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/b4b4r07'
      ln_s buildpath, buildpath/'.go/src/github.com/b4b4r07/history'
      system 'make', 'build'
      bin.install 'bin/history'
    else
      bin.install 'history'
    end
  end

  test do
    system 'history', '--version'
  end
end
