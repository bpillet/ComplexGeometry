LATEX = latex -interaction=nonstopmode
PDFLATEX = pdflatex -synctex=1 -interaction=nonstopmode
BIBTEX = bibtex -terse
MAKEINDEX = makeindex -s index.ist
INDEXES = $(wildcard cat .makeinfo_indexes 2> /dev/null)
RERUN = 'There were undefined references'
BIBLI = 'bibliography'
SRC = $(wildcard *.tex)
IMG = $(SRC:.tex=.pdf)
URL = https://raw.githubusercontent.com/bpillet/Latex/master/Headfiles/
TEACHING = $(URL)Teaching/teaching.sty $(URL)Teaching/logo_rennes1.pdf

.SUFFIXE:

.PHONY: clean all

# S'occupe de tous les fichiers .tex
all: $(SRC) $(IMG)

# Cas particulier des fichiers HEAD.tex, HEADB.tex, HEAD_en.tex dipneuste.sty amsdip.sty et teaching.sty se contente de les sauvegarder !
HEAD.pdf HEADB.pdf HEAD_en.pdf dipneuste.pdf amsdip.pdf teaching.pdf: ;

# Création du fichier rendu pdf
%.pdf : %.tex %.aux
	@echo $?
	if egrep -q $(BIBLI) $*.tex; then $(BIBTEX) $*.aux; fi 
	if [ -e $*.idx ]; then wget -qN $(URL)index.ist; $(MAKEINDEX) $*.idx; fi 
	$(PDFLATEX) $*.tex
	if egrep -q $(RERUN) $*.log; then $(PDFLATEX) $*.tex; fi

# Création du fichier .aux
%.aux: %.tex
	@echo $?
	if egrep -q 'dipneuste' $*.tex; then wget -qN $(URL)/dipneuste.sty; fi
	if egrep -q 'amsdip' $*.tex; then wget -qN $(URL)/amsdip.sty; fi
	if egrep -q '{teaching}' $*.tex; then wget -qN $(TEACHING); fi
	$(PDFLATEX) $*.tex

clean:
	rm *.log *.aux *.dvi *.bbl *.blg *.ilg *.toc *.lof *.lot *.idx *.ind *.ps  *~
