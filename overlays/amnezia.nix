# overlays/amnezia.nix
final: prev: {
  amnezia-vpn = prev.amnezia-vpn.overrideAttrs (oldAttrs: {
    version = "4.8.12.9";

    src = prev.fetchFromGitHub {
      owner = "amnezia-vpn";
      repo = "amnezia-client";
      rev = "f73792844ce5e5bd26b6ba2fe93481d3d39243a6";
      hash = "sha256-WW/N7L6G30DJg7Bs0AQL7Kmqv1CNN1FBXY6TpH8fgmY=";
      fetchSubmodules = true;
    };

    awg-vendored = prev.amneziawg-go;
    amnezia-tun2socks = prev.tun2socks;

    postPatch = ''
      # AmneziaWG-go
      substituteInPlace client/platforms/linux/daemon/wireguardutilslinux.cpp \
        --replace-fail 'm_tunnel.start(appPath.filePath("../../client/bin/wireguard-go"), wgArgs);' \
        'm_tunnel.start("${prev.amneziawg-go}/bin/amneziawg-go", wgArgs);'

      # OpenVPN
      substituteInPlace client/utilities.cpp \
        --replace-fail 'return Utils::executable("../../client/bin/openvpn", true);' \
        'return Utils::executable("${prev.openvpn}/bin/openvpn", false);'

      # tun2socks
      substituteInPlace client/utilities.cpp \
        --replace-fail 'return Utils::executable("../../client/bin/tun2socks", true);' \
        'return Utils::executable("${prev.tun2socks}/bin/amnezia-tun2socks", false);'

      # wg-quick
      substituteInPlace client/utilities.cpp \
        --replace-fail 'return Utils::usrExecutable("wg-quick");' \
        'return Utils::executable("${prev.wireguard-tools}/bin/wg-quick", false);'

      # Cloak
      substituteInPlace client/protocols/openvpnovercloakprotocol.cpp \
        --replace-fail 'return Utils::executable(QString("/ck-client"), true);' \
        'return Utils::executable("${prev.cloak-pt}/bin/ck-client", false);'

      # Shadowsocks
      substituteInPlace client/protocols/shadowsocksvpnprotocol.cpp \
        --replace-fail 'return Utils::executable(QString("/ss-local"), true);' \
        'return Utils::executable("${prev.shadowsocks-rust}/bin/sslocal", false);'

      # OpenVPN configurator
      substituteInPlace client/configurators/openvpn_configurator.cpp \
        --replace-fail ".arg(qApp->applicationDirPath());" ".arg(\"$out/libexec\");"

      # Autostart
      substituteInPlace client/ui/qautostart.cpp \
        --replace-fail "/usr/share/pixmaps/AmneziaVPN.png" "AmneziaVPN"

      # Desktop file
      substituteInPlace deploy/installer/config/AmneziaVPN.desktop.in \
        --replace-fail "/usr/share/pixmaps/AmneziaVPN.png" "$out/share/icons/hicolor/512x512/apps/AmneziaVPN.png"

      # Systemd service
      substituteInPlace deploy/data/linux/AmneziaVPN.service \
        --replace-fail "ExecStart=/opt/AmneziaVPN/service/AmneziaVPN-service.sh" \
        "ExecStart=$out/bin/AmneziaVPN-service" \
        --replace-fail "Environment=LD_LIBRARY_PATH=/opt/AmneziaVPN/client/lib" ""

      # CMake 3rdparty
      substituteInPlace client/cmake/3rdparty.cmake \
        --replace-fail 'set(LIBSSH_LIB_PATH "''${LIBSSH_ROOT_DIR}/linux/x86_64/libssh.a")' \
        'set(LIBSSH_LIB_PATH "${prev.libssh}/lib/libssh.so")' \
        --replace-fail 'set(ZLIB_LIB_PATH "''${LIBSSH_ROOT_DIR}/linux/x86_64/libz.a")' \
        'set(ZLIB_LIB_PATH "${prev.zlib}/lib/libz.so")' \
        --replace-fail 'set(OPENSSL_INCLUDE_DIR "''${OPENSSL_ROOT_DIR}/linux/include")' \
        'set(OPENSSL_INCLUDE_DIR "${prev.openssl.dev}/include")' \
        --replace-fail 'set(OPENSSL_LIB_SSL_PATH "''${OPENSSL_ROOT_DIR}/linux/x86_64/libssl.a")' \
        'set(OPENSSL_LIB_SSL_PATH "${prev.openssl.out}/lib/libssl.so")' \
        --replace-fail 'set(OPENSSL_LIB_CRYPTO_PATH "''${OPENSSL_ROOT_DIR}/linux/x86_64/libcrypto.a")' \
        'set(OPENSSL_LIB_CRYPTO_PATH "${prev.openssl.out}/lib/libcrypto.so")' \
        --replace-fail 'set(OPENSSL_USE_STATIC_LIBS TRUE)' 'set(OPENSSL_USE_STATIC_LIBS FALSE)'

      # Service CMake
      substituteInPlace service/server/CMakeLists.txt \
        --replace-fail 'set(OPENSSL_INCLUDE_DIR "''${OPENSSL_ROOT_DIR}/linux/include")' \
        'set(OPENSSL_INCLUDE_DIR "${prev.openssl.dev}/include")' \
        --replace-fail 'set(OPENSSL_LIB_CRYPTO_PATH "''${OPENSSL_ROOT_DIR}/linux/x86_64/libcrypto.a")' \
        'set(OPENSSL_LIB_CRYPTO_PATH "${prev.openssl.out}/lib/libcrypto.so")' \
        --replace-fail 'set(OPENSSL_USE_STATIC_LIBS TRUE)' 'set(OPENSSL_USE_STATIC_LIBS FALSE)'
    '';

    passthru = oldAttrs.passthru // {
      awg-vendored = prev.amneziawg-go;
      amnezia-tun2socks = prev.tun2socks;
    };
  });
}
