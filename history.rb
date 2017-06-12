class History < Formula
  homepage 'https://github.com/b4b4r07/history'
  version '0.0.1'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/b4b4r07/history/releases/download/0.0.1/darwin_amd64_history'
    sha256 'bf3a57b076ca79c16a6ba1838f4633521292fd6531ce29b3bf87f77baff33470'
  else
      # TODO
      return
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
      bin.install 'build/history'
    else
      bin.install 'history'
    end
  end

  test do
    system 'history', '--version'
  end
end
