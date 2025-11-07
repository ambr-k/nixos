{
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.loupe];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = builtins.listToAttrs (
      builtins.map
      (mime: {
        name = mime;
        value = "org.gnome.Loupe.desktop";
      })
      (lib.strings.splitString ";" "image/jpeg;image/png;image/gif;image/webp;image/tiff;image/x-tga;image/vnd-ms.dds;image/x-dds;image/bmp;image/vnd.microsoft.icon;image/vnd.radiance;image/x-exr;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-portable-anymap;image/x-qoi;image/qoi;image/svg+xml;image/svg+xml-compressed;image/avif;image/heic;image/jxl")
    );
  };
}
