OTT_FILES = core.ott rules.ott
ROOT_NAME = stlc
PDF = stlc.pdf
COQ_FILES = lemmas.v

OTT_FLAGS=-merge true -tex_wrap false

OTT_TEX = $(ROOT_NAME)-ott.tex
OTT_COQ = $(ROOT_NAME)ott.v

OTT_COQ_DIR = ott-coq-files

all: $(PDF)

%.pdf: %.tex
	latexmk -pdf $<

%.tex: %.mng $(OTT_TEX)
	ott $(OTT_FLAGS) $(OTT_FILES) -tex_filter $< $@

$(OTT_TEX): $(OTT_FILES)
	ott $(OTT_FLAGS) $(OTT_FILES) -o $@

$(OTT_COQ): $(OTT_FILES)
	ott -coq_expand_list_types false -o $(OTT_COQ) $(OTT_FLAGS) $(OTT_FILES)

coq: Makefile.coq
	$(MAKE) -f Makefile.coq

Makefile.coq: $(COQ_FILES) $(OTT_COQ)
	coq_makefile $(COQ_FILES) $(OTT_COQ) -Q $(OTT_COQ_DIR) Ott -o Makefile.coq

clean: $(ROOT_NAME).tex
	latexmk -c $(ROOT_NAME)
	rm -rf *.glob *.vo *.v.d
	rm -rf $(OTT_COQ_DIR)/*.{vo,glob,v.d}
	rm -rf $(OTT_COQ_DIR)/Makefile.coq
	rm -rf Makefile.coq
	rm -rf $(ROOT_NAME).tex $(OTT_TEX) $(OTT_COQ)
	rm -rf $(PDF)
