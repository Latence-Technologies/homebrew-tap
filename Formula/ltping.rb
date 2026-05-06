class Ltping < Formula
  include Language::Python::Virtualenv

  desc "HTTP/DNS/TCP latency tool with SLO validation and HDR histogram"
  homepage "https://latencetech.com"
  url "https://files.pythonhosted.org/packages/44/a5/eb18e8c8fdf7fd1d0eb825bf6a7787551a36d4a55a0fd59f226657ebfeae/ltping-1.7.5.tar.gz"
  sha256 "bdd1f409182bb8133cdbf776ec29c5651f86e606548e7ad4ef13c85adb297234"
  license "AGPL-3.0-only"

  depends_on "python@3.12"

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  resource "hdrhistogram" do
    url "https://files.pythonhosted.org/packages/c2/79/674aad5279dd1a77b85efa1cbf8dcead209dc5f38f55cbbfd75bc20cc65b/hdrhistogram-0.10.3.tar.gz"
    sha256 "f3890df0a6f3c582a0a8b2a49a568729cb319f1600683e4458cc98b68ca32841"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "ltping #{version}", shell_output("#{bin}/ltping --version")
    shell_output("#{bin}/ltping --audit 2>&1")
  end
end
