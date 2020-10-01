OTT_FILES = core.ott rules.ott
ROOT_NAME = stlc
PDF = stlc.pdf
COQ_FILES = cruft.v lemmas.v
LAST_COQ_FILE = lemmas.v

OTT_FLAGS=-merge true -tex_wrap false

OTT_TEX = $(ROOT_NAME)-ott.tex
OTT_COQ = $(ROOT_NAME)ott.v

OTT_COQ_DIR = ott-coq-files
OTT_COQ_BASE = $(OTT_COQ_DIR)/ott_list.v

all: $(PDF)

%.pdf: %.tex
	latexmk -pdf $<

%.tex: %.mng $(OTT_TEX)
	ott $(OTT_FLAGS) $(OTT_FILES) -tex_filter $< $@

$(OTT_TEX): $(OTT_FILES)
	ott $(OTT_FLAGS) $(OTT_FILES) -o $@

$(OTT_COQ): $(OTT_FILES)
	ott -coq_expand_list_types false -o $(OTT_COQ) $(OTT_FLAGS) $(OTT_FILES)

$(OTT_COQ_BASE:%.v=%.vo): $(OTT_COQ_BASE)
	cd $(OTT_COQ_DIR) && make

$(LAST_COQ_FILE:%.v=%.vo): $(COQ_FILES) $(OTT_COQ) $(OTT_COQ_BASE:%.v=%.vo)
	coqc -I $(OTT_COQ_DIR) $(OTT_COQ) $(COQ_FILES)

coq: $(LAST_COQ_FILE:%.v=%.vo)

clean: $(ROOT_NAME).tex
	latexmk -c $(ROOT_NAME)
	rm -rf *.glob *.vo
	rm -rf $(OTT_COQ_DIR)/*{.vo,.glob}
	rm -rf $(ROOT_NAME).tex $(OTT_TEX) $(OTT_COQ)
	rm -rf $(PDF)
