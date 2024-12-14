{stdenv, fetchFromGitHub, cmake}:
stdenv.mkDerivation rec {
  pname = "yoga-touch-keyboard";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "7oi";
    repo = "chromiumos_touch_keyboard";
    rev = "v${version}";
    hash = "sha256-ZP/bXYciSFjP0TKXW9o+1yuQVL229mDU32WqBoQsc7A=";
  };

  meta = {
    description = "Touch keyboard for the Yoga Book";
    homepage = "https://github.com/7oi/chromiumos_touch_keyboard";
  };

  nativeBuildInputs = [ cmake ];

}
