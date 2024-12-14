{stdenv, fetchFromGitHub, cmake}:
stdenv.mkDerivation rec {
  pname = "yoga-touch-keyboard";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "7oi";
    repo = "chromiumos_touch_keyboard";
    rev = "v${version}";
    hash = "sha256-aU4oHwBjXGZYgnvbQU6zFknIQD10XqyQUBZOtblN3Xo=";
  };

  meta = {
    description = "Touch keyboard for the Yoga Book";
    homepage = "https://github.com/7oi/chromiumos_touch_keyboard";
  };

  nativeBuildInputs = [ cmake ];

}
