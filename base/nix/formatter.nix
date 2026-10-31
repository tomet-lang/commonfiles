{ tomet, ... }:
{
  projectRootFile = "flake.nix";
  programs = {
    #= Nix
    nixfmt.enable = true;
    statix.enable = true;
    deadnix.enable = true;

    #= Shell
    shfmt.enable = true;
    shellcheck.enable = true;

    #= Main
    rustfmt.enable = true;
    taplo.enable = true;

    #= Web / TS / JS / JSON
    biome = {
      enable = true;
      formatCommand = "format";
      settings = {
        formatter = {
          enabled = true;
          useEditorconfig = true;
        };
        linter.enabled = false;
        assist.enabled = false;
      };
      includes = [
        "*.json"
        "*.jsonc"
        #--- Web ----
        "*.js"
        "*.ts"
        "*.mjs"
        "*.mts"
        "*.cjs"
        "*.cts"
        "*.jsx"
        "*.tsx"
      ];
    };
  };

  settings = {
    global.excludes = [
      "*.lock"
    ];

    formatter = {
      tomet = {
        command = "${tomet}/bin/tomet";
        options = [
          "format"
          "-i"
        ];
        includes = [ "*.tmt" ];
      };
    };

    shfmt = {
      includes = [ "*.sh" ];
    };

    rustfmt = {
      includes = [ "*.rs" ];
    };
  };
}
