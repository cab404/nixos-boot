{
  pkgs ? import <nixpkgs> {},
  theme ? "load_unload", # TODO: Should be a list when more themes come
  bgColor ? "1, 1, 1", # rgb value between 0-1. TODO: Write hex to plymouth magic
}: pkgs.runCommand "nixos-boot" {} ''
    mkdir -p $out/share/plymouth/themes/
    cp -r ${./src/${theme}} $out/share/plymouth/themes/${theme}
    chmod +rw -R $out/share/plymouth/themes/${theme}
    # Set the Background Color
    cd $out/share/plymouth/themes/${theme}

    sed -i 's/\(Window\.SetBackground[^ ]*\).*/\1 (${bgColor});/' "${theme}.script"
    sed -i "s@\/usr\/@$out\/@" $out/share/plymouth/themes/${theme}/${theme}.plymouth

    chmod +x *.plymouth *.script
''