LATEX=lualatex -shell-escape
LATEXMK=latexmk

FINAL=contexte résumé

all: contexte.pdf résumé.pdf

.refresh:
	touch .refresh

%.pdf: %.tex $(SOURCES)
	$(LATEXMK) -pdflatex='$(LATEX)' -pdf $*.tex
	
force: .refresh all

.PHONY: clean force all

clean:
	$(LATEXMK) -C *.tex
	rm -f *.pdfsync
	rm -rf *~ *.tmp *.auxlock *.bbl *.tdo *.loe