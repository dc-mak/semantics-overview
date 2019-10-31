{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {

    name = "semantics-overview";

    buildInputs = [
        (texlive.combine {
            inherit (texlive)
            amsmath
            beamer
            beamertheme-metropolis
            cm-super
            ebproof
            ec
            etoolbox
            euenc
            fontspec
            fpl
            hardwrap
            latexmk
            mathspec
            mathpazo
            metafont
            ms
            palatino
            pgfopts
            realscripts # handout with xetex
            setspace
            scheme-basic
            titlesec
            textcase
            tufte-latex
            xetex
            xetex-def
            xltxtra # handout with xetex
            zapfding
            ;
        })
    ];

    FONTCONFIG_FILE = makeFontsConf { fontDirectories = [ fira fira-mono ]; };

    src = ./.;

    installPhase = ''
      mkdir -p $out
      cp *.pdf $out
    '';
}

# vim: set sw=4 sts=4 ft=conf:
