{stdenv, fetchFromGitHub, cmake}:
stdenv.mkDerivation rec {
  pname = "yoga-touch-keyboard";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "7oi";
    repo = "chromiumos_touch_keyboard";
    rev = "v${version}";
    hash = "sha256-ibC15zd7EfPuU2nRyk7x2y+vgZRCQdsSqqFH5L5QT+U=";
  };

  meta = {
    description = "Touch keyboard for the Yoga Book";
    homepage = "https://github.com/7oi/chromiumos_touch_keyboard";
  };

  nativeBuildInputs = [ cmake ];

}
