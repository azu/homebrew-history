class History < Formula
  homepage 'https://github.com/b4b4r07/history'
  version '0.0.1'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/b4b4r07/history/releases/download/0.0.1/history-0.0.1-darwin-amd64.tar.gz'
    sha256 '44ea00da57e3dca91f348c44ff28f7822ae6eb74902a6c973e7dbf46829bf138'
  else
    url 'https://github.com/b4b4r07/history/releases/download/0.0.1/history-0.0.1-darwin-386.tar.gz'
    sha256 'acd20dc56b4e58192405dc32e8bc7bacf4f52d4fef23d4e468ef24fb8df7164a'
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
