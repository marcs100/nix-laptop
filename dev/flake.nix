{
  description = "A Rust and Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self , nixpkgs ,... }: let
    # system should match the system you are running on
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      # 
      packages = with pkgs; [
        rustc
        cargo
        rust-analyzer
        python312
        python312Packages.tkinter
        python312Packages.python-lsp-server
        vscode-extensions.vadimcn.vscode-lldb
        lldb
        lua-language-server
        bash-language-server
        clang
      ];

      shellHook = ''
        echo "------------------------"
        echo "|  Development Shell    |"
        echo "------------------------"
        export PS1="\e[1;34m<\u@dev>\e[0m \e[1;32m$\e[0m "
      '';
    };
  };
}
