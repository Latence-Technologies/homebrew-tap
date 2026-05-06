class Ltping < Formula
  include Language::Python::Virtualenv

  desc "HTTP/DNS/TCP latency tool with SLO validation and HDR histogram"
  homepage "https://latencetech.com"
  url "https://files.pythonhosted.org/packages/source/l/ltping/ltping-1.7.5.tar.gz"
  sha256 "bdd1f409182bb8133cdbf776ec29c5651f86e606548e7ad4ef13c85adb297234"
  license "AGPL-3.0-only"

  depends_on "python@3.12"

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/source/d/dnspython/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  resource "hdrhistogram" do
    url "https://files.pythonhosted.org/packages/source/h/hdrhistogram/hdrhistogram-0.10.3.tar.gz"
    sha256 "f3890df0a6f3c582a0a8b2a49a568729cb319f1600683e4458cc98b68ca32841"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/source/P/PyYAML/PyYAML-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/source/t/tqdm/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Version check
    assert_match "ltping #{version}", shell_output("#{bin}/ltping --version")

    # Audit runs without network — exits 0 (no errors) or 1 (config warnings)
    output = shell_output("#{bin}/ltping --audit 2>&1", 0)
    assert_match "ltping --audit", output
  end
end
