LATEX = latex -interaction=nonstopmode
PDFLATEX = pdflatex -synctex=1 -interaction=nonstopmode
BIBTEX = bibtex -terse
MAKEINDEX = wget $(URL)index.ist ; makeindex -s index.ist
INDEXES = $(wildcard cat .makeinfo_indexes 2> /dev/null)
RERUN = 'There were undefined references'
BIBLI = 'bibliography'
SRC = $(wildcard *.tex)
IMG = $(SRC:.tex=.pdf)
URL = https://raw.githubusercontent.com/bpillet/Latex/master/Headfiles/
ONLINE = wget -qN $(URL)dipneuste.sty $(URL)amsdip.sty

.SUFFIXE:

.PHONY: clean all

# S'occupe de tous les fichiers .tex
all: $(SRC) $(IMG)

# Cas particulier des fichiers HEAD.tex, HEADB.tex, HEAD_en.tex dipneuste.sty et amsdip.sty se contente de les sauvegarder !
HEAD.pdf HEADB.pdf HEAD_en.pdf dipneuste.pdf amsdip.pdf: ;

# Création du fichier rendu pdf
%.pdf : %.tex %.aux
	@echo $?
	if egrep -q $(BIBLI) $*.tex; then $(BIBTEX) $*.aux; fi 
	if [ -e $*.idx ]; then wget $(URL)index.ist; $(MAKEINDEX) $*.idx; fi 
	$(PDFLATEX) $*.tex
	if egrep -q $(RERUN) $*.log; then $(PDFLATEX) $*.tex; fi

# Création du fichier .aux
%.aux: %.tex
	@echo $?
	if [ ! -e dipneuste.sty ]; then $(ONLINE); fi
	if [ ! -e amsdip.sty ]; then $(ONLINE); fi
	$(PDFLATEX) $*.tex

clean:
	rm *.log *.aux *.dvi *.bbl *.blg *.ilg *.toc *.lof *.lot *.idx *.ind *.ps  *~
