OTT_FILES = core.ott rules.ott
ROOT_NAME = stlc
PDF = stlc.pdf

OTT_FLAGS=-merge true -tex_wrap false

OTT_TEX = $(ROOT_NAME)-ott.tex

all: $(PDF)

%.pdf: %.tex
	latexmk -pdf $<

%.tex: %.mng $(OTT_TEX)
	ott $(OTT_FLAGS) $(OTT_FILES) -tex_filter $< $@

$(OTT_TEX): $(BLOB)
	ott $(OTT_FLAGS) $(OTT_FILES) -o $@

clean: $(ROOT_NAME).tex
	latexmk -c $(ROOT_NAME)
	rm -rf *.blob
	rm -rf $(ROOT_NAME).tex $(OTT_TEX)
	rm -rf $(PDF)
