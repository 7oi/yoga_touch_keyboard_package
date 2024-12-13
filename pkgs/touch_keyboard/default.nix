{stdenv, fetchFromGitHub, cmake}:
stdenv.mkDerivation rec {
  name = "yoga_touch_keyboard-${version}";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "7oi";
    repo = "chromiumos_touch_keyboard";
    rev = "v${version}";
    hash = "sha256-ZP/bXYciSFjP0TKXW9o+1yuQVL229mDU32WqBoQsc7A=";
  };



  nativeBuildInputs = [ cmake ];
  buildInputs = [ ];

}
