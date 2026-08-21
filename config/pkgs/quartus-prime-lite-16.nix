{
  buildFHSEnv,
  fetchurl,
  lib,
  makeDesktopItem,
  stdenv,
  unstick,
  unzip,
}:

let
  baseVersion = "16.1.0.196";
  version = "16.1.1.200";

  fetchQuartus = { name, sha1, path ? "16.1/196/ib_installers" }:
    fetchurl {
      inherit name sha1;
      url = "https://download.altera.com/akdlm/software/acdsinst/${path}/${name}";
    };

  supportedDevices = [
    "Arria II"
    "Cyclone IV"
    "Cyclone V"
    "MAX II/V"
    "MAX 10 FPGA"
  ];

  deviceIds = {
    "Arria II" = "arria";
    "Cyclone IV" = "cyclone";
    "Cyclone V" = "cyclonev";
    "MAX II/V" = "max";
    "MAX 10 FPGA" = "max10";
  };

  deviceFiles = {
    arria = fetchQuartus {
      name = "arria-${baseVersion}.qdz";
      sha1 = "e284a2becbaea0cb0b2acdf2d60e1c3da0db6628";
    };
    cyclone = fetchQuartus {
      name = "cyclone-${baseVersion}.qdz";
      sha1 = "34ed91bca7cfd24c15cee43eaaef87478ccfbd3e";
    };
    cyclonev = fetchQuartus {
      name = "cyclonev-${baseVersion}.qdz";
      sha1 = "ed3bccbae12e7d8abef4840891f4e7cec2d5ffe6";
    };
    max = fetchQuartus {
      name = "max-${baseVersion}.qdz";
      sha1 = "590db04c9b9eca97617f6e6cacfc09bd531cffb1";
    };
    max10 = fetchQuartus {
      name = "max10-${baseVersion}.qdz";
      sha1 = "49b7be4a0c863d11a868c4033b50a6c588aa79f6";
    };
  };

  quartus = stdenv.mkDerivation {
    pname = "quartus-prime-lite-unwrapped";
    inherit version;

    nativeBuildInputs = [
      unstick
      unzip
    ];

    srcs =
      [
        (fetchQuartus {
          name = "QuartusLiteSetup-${baseVersion}-linux.run";
          sha1 = "d058cb5d914fe7e85408f08aad82f75e43eb8d6b";
        })
        (fetchQuartus {
          name = "QuartusSetup-${version}-linux.run";
          sha1 = "621e190d2ccaa2c336f10b44ad9138f3bac08350";
          path = "16.1.1/200/update";
        })
      ]
      ++ map (device: deviceFiles.${deviceIds.${device}}) supportedDevices;

    buildCommand =
      let
        disabledComponents = [
          "quartus_help"
          "quartus_update"
          "modelsim_ae"
          "modelsim_ase"
          "arria10"
          "arria10_part1"
          "arria10_part2"
          "arria10_part3"
          "arriav"
          "arriavgz"
          "stratixiv"
          "stratixv"
        ];
      in
      ''
        echo "setting up Quartus ${baseVersion} installers..."
        for src in $srcs; do
          case "$src" in
            *.run)
              cp "$src" "$TEMP/$(basename "$src")"
              chmod u+w,+x "$TEMP/$(basename "$src")"
              patchelf --interpreter "$(cat "$NIX_CC/nix-support/dynamic-linker")" "$TEMP/$(basename "$src")"
              ;;
            *.qdz)
              ln -s "$src" "$TEMP/$(basename "$src")"
              ;;
          esac
        done

        echo "installing Quartus ${baseVersion}..."
        unstick "$TEMP/QuartusLiteSetup-${baseVersion}-linux.run" \
          --disable-components ${lib.concatStringsSep "," disabledComponents} \
          --mode unattended --installdir "$out" --accept_eula 1

        echo "applying Quartus ${version} update..."
        unstick "$TEMP/QuartusSetup-${version}-linux.run" \
          --mode unattended --installdir "$out" --accept_eula 1

        substituteInPlace "$out/quartus/adm/qenv.sh" \
          --replace-fail 'grep sse /proc/cpuinfo > /dev/null 2>&1' ':'

        rm -rf "$out/uninstall" "$out/logs"
      '';

    meta = {
      homepage = "https://fpgasoftware.intel.com";
      description = "FPGA design and simulation software";
      sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
      license = lib.licenses.unfree;
      platforms = [ "x86_64-linux" ];
    };
  };

  desktopItem = makeDesktopItem {
    name = "quartus-prime-lite-16";
    exec = "quartus-prime-lite-16";
    icon = "quartus";
    desktopName = "Quartus Prime Lite 16.1.1";
    genericName = "Quartus FPGA IDE";
    categories = [ "Development" ];
  };
in
buildFHSEnv {
  pname = "quartus-prime-lite";
  inherit version;

  targetPkgs =
    pkgs: with pkgs; [
      glib
      libice
      libsm
      libxau
      libxdmcp
      libxscrnsaver
      libudev0-shim
      zlib
      expat
      dbus
      libxtst
      libxi
      dejavu_fonts
      gnumake
    ];

  multiPkgs =
    pkgs:
    with pkgs;
    let
      freetype = pkgs.freetype.override { libpng = libpng12; };
      fontconfig = pkgs.fontconfig.override { inherit freetype; };
      libxft = pkgs.libxft.override { inherit freetype fontconfig; };
    in
    [
      libxml2
      ncurses5
      unixodbc
      libxft
      freetype
      fontconfig
      libx11
      libxext
      libxrender
      libxcrypt-legacy
    ];

  extraInstallCommands = ''
    mkdir -p "$out/share/applications" "$out/share/icons/hicolor/64x64/apps"
    ln -s ${desktopItem}/share/applications/* "$out/share/applications"
    ln -s ${quartus}/quartus/adm/quartusii.png "$out/share/icons/hicolor/64x64/apps/quartus.png"
    ln -s "$out/bin/quartus-prime-lite" "$out/bin/quartus-prime-lite-16"
    ln -s "$out/bin/quartus-prime-lite" "$out/bin/quartus"
  '';

  runScript = "${quartus}/quartus/bin/quartus";

  meta = quartus.meta;
}
