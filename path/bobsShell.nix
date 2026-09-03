{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell rec {
  buildInputs = with pkgs; [
    expat
    fontconfig
    freetype
    freetype.dev
    libGL
    pkg-config
    libX11
    libXcursor
    libXi
    libXrandr
    wayland
    libxkbcommon
  ];

  LD_LIBRARY_PATH = builtins.foldl' (a: b: "${a}:${b}/lib") "${pkgs.vulkan-loader}/lib" buildInputs;

    shellHook = ''
        /home/antonio/repos/cart-pucminas/bobs8085/target/release/bobs8085-gui
        exit
    '';
}
