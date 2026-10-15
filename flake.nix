{
  description = "Nix flake for my Quickshell development environment";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs:
  let
    packages = builtins.mapAttrs (system: pkgs: {
      inherit (pkgs)
        tree
        claude-code
        mkShell
      ;
      default = inputs.self.packages.${system}.mkShell;
    }) inputs.nixpkgs.legacyPackages;
  in
  {
    devShells.x86_64-linux.default = packages.x86_64-linux.mkShell {
      buildInputs = with packages.x86_64-linux; [
        tree
        claude-code
      ];
      shellHook = ''
        export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
        export ANTHROPIC_AUTH_TOKEN=REDACTED
        export ANTHROPIC_MODEL=deepseek-flash[1m]
        export ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-flash[1m]
        export ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-flash[1m]
        export ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-flash
        export CLAUDE_CODE_SUBAGENT_MODEL=deepseek-flash
        export CLAUDE_CODE_EFFORT_LEVEL=max
        export CLAUDE_CODE_AUTO_COMPACT_WINDOW=786432
        export PS1="\e[0;34m[DEVSHELL]$PS1"

        echo -e '\e[0;33mDevShell initalized! Remember to set your Deepseek API key in `\e[0;35mANTHROPIC_AUTH_TOKEN\e[0;37m`'
      '';
    };
  };
}
