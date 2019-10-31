.SUFFIXES: .pdf .tex .bib $(SUFFIXES)

FLAGS := -quiet

BUILD := build

SRC := notes.tex \
       references.bib

PDFS := handout.pdf \
        slides.pdf

.PHONY: all clean

all: $(PDFS)

.SECONDEXPANSION:
$(PDFS):%.pdf: $$*.tex $(SRC) | $(BUILD)
	latexmk -xelatex -pdf -dvi- -ps- $< -shell-escape -output-directory=$(BUILD) $(FLAGS)
	mv $(BUILD)/$@ $@

$(BUILD): %:
	mkdir -p $@

clean:
	rm -rf $(BUILD)

# bib:
# 	@bibtex handout
# handout:
# 	@latexmk -bibtex -pdf -shell-escape handout
# slides:
# 	@xelatex slides
# clean:
# 	@rm -f *.aux
# 	@rm -f *.bbl
# 	@rm -f *.blg
# 	@rm -f *.dvi
# 	@rm -f *.log
# 	@rm -f *.nav
# 	@rm -f *.out
# 	@rm -f *.snm
# 	@rm -f *.toc
