class Clusterawsadm < Formula
  version "0.7.0"
  desc "Kubernetes Cluster API Provider AWS provides consistent deployment and day 2 operations of self-managed and EKS Kubernetes clusters on AWS."
  homepage "http://cluster-api-aws.sigs.k8s.io/"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v#{version}/clusterawsadm-darwin-amd64"
    sha256 "9dbf25637168e142dea0a0e55afd345a227d0b4bae73a2f39893024df7c0f445"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v#{version}/clusterawsadm-darwin-amd64"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v#{version}/clusterawsadm-linux-amd64"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v#{version}/clusterawsadm-linux-arm64"
    sha256 ""
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "clusterawsadm-darwin-amd64" => "clusterawsadm"
    end
    if OS.mac? && Hardware::CPU.arm?
      bin.install "clusterawsadm-darwin-arm64" => "clusterawsadm"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "clusterawsadm-linux-amd64" => "clusterawsadm"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "clusterawsadm-linux-arm64" => "clusterawsadm"
    end
  end

  test do
    system "#{bin}/clusterawsapi --version"
  end
end
