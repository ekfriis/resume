SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
TXTS=$(SRC:.md=.txt)
HTML=$(SRC:.md=.html)

all:    $(PDFS) $(HTML) $(TXTS)

pdf:   clean $(PDFS)
html:  clean $(HTML)

%.html: %.md
	python resume.py html < $< | pandoc -t html -c resume.css -o $@

%.pdf:  %.md
	python resume.py tex < $< | pandoc --template=./pandoc-templates/default.latex -H header.tex -o $@

%.txt:  %.md
	cp $< $@

clean:
	rm -f *.html *.pdf

