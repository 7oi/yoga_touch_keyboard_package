{stdenv, fetchFromGitHub, cmake}:
stdenv.mkDerivation rec {
  name = "yoga_touch_keyboard-${version}";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "7oi";
    repo = "chromiumos_touch_keyboard";
    rev = "v${version}";
    hash = "sha256-bHvAET3VgcNelUsGELUQ9bHcdAfRCSP+3Bw8ovOpRU4=";
  };



  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];

  # configurePhase = ''
  #   mkdir -p build
  #   cd build
  #   cmake ../
  # '';

  # buildPhase = ''
  #   pwd
  #   make
  # '';

  # installPhase = ''
  #   mkdir -p $out/bin
  #   make install
  # '';
}
