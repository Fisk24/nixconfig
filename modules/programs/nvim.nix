{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Packages Required by my nvim config
    neovim
    ripgrep
    gnumake
    gcc
    unzip
    xclip
    cargo
    wget
    git
    python3
    lua51Packages.luarocks
  ];
}
