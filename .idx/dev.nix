# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
packages = [
    pkgs.nodejs_20
    pkgs.nspr
    pkgs.glib
    pkgs.glibc
    pkgs.nss
    pkgs.jellyfin-ffmpeg
    pkgs.dbus
    pkgs.atk
    pkgs.expat
    pkgs.xorg.libX11
    pkgs.xorg.libXcomposite
    pkgs.xorg.libXdamage
    pkgs.xorg.libXfixes
    pkgs.xorg.libXext
    pkgs.xorg.libXrandr
    pkgs.xorg.libxcb
    pkgs.mesa
    pkgs.libdrm
    pkgs.libxkbcommon
    pkgs.alsa-lib
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
          # and show it in IDX's web preview panel
          command = ["npm" "start" "--port" "$PORT" "--host" "0.0.0.0"];
          # command = ["python3" "-m" "http.server" "$PORT" "--bind" "0.0.0.0" "--directory" "build"];
          manager = "web";
          env = {
            # Environment variables to set for your server
            PORT = "$PORT";
          };
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        npm-install = "npm install";
        default.openFiles = [ "public/code1.tsx" "public/code2.tsx" "public/code3.tsx" "public/code4.swift"];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
      };
    };
  };
}
