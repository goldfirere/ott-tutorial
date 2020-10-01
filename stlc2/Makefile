OTT_FILES = core.ott rules.ott
ROOT_NAME = stlc
PDF = stlc.pdf

OTT_FLAGS=-merge true -tex_wrap false

BLOB = $(ROOT_NAME).blob
OTT_TEX = $(ROOT_NAME)-ott.tex

all: $(PDF)

%.pdf: %.tex
	latexmk -pdf $<

%.tex: %.mng $(OTT_TEX)
	ott $(OTT_FLAGS) -tex_filter $< $@ -readsys $(BLOB)

$(OTT_TEX): $(BLOB)
	ott $(OTT_FLAGS) -readsys $< -o $@

$(BLOB): $(OTT_FILES)
	ott $(OTT_FLAGS) -writesys $@ $^

clean: $(ROOT_NAME).tex
	latexmk -c $(ROOT_NAME)
	rm -rf *.blob
	rm -rf $(ROOT_NAME).tex $(OTT_TEX)
	rm -rf $(PDF)