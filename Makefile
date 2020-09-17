# Makefile for "Complex networks, complex processes"
#
# Copyright (C) 2014-2020 Simon Dobson
# 
# Licensed under the Creative Commons Attribution-Share Alike 4.0 
# International License (https://creativecommons.org/licenses/by-sa/4.0/).
#

# ----- Sources -----

# Text
INDEX = index.md
TEXT = \
	preface.md \
	introduction.md \
	basicideas.md \
	zbibliography.md \
	acknowledgements.md \
	about.md \
	copyright.md

# Notebooks
NOTEBOOKS = 

# Image files
RAW_IMAGES = \
	cc-by-nc-sa.png \
	qr.png \
	konigsberg-bridges.png \
	sd.png
SVG_IMAGES = \
	concepts-paths.svg \
	ipython-parallelism.svg \
	ipython-local-parallelism.svg \
	ipython-local-parallelism-one.svg \
	ipython-mechanics.svg \
	ipython-remote-client-parallelism.svg \
	disease-periods.svg \
	disease-types.svg \
	synchronous-dynamics-uml.svg \
	stochastic-dynamics-uml.svg
GENERATED_IMAGES = $(SVG_IMAGES:.svg=.png)

# Bibliography
BIBLIOGRAPHY = bibliography.bib

# License
LICENSE = LICENSE

# Structure
BOOK_CONFIG = _config.yml
BOOK_TOC = _toc.yml

# All content
CONTENT = \
	$(INDEX) \
	$(TEXT) \
	$(NOTEBOOKS) \
	$(RAW_IMAGES) $(GENERATED_IMAGES) \
	$(BIBLIOGRAPHY) \
	$(BOOK_CONFIG) $(BOOK_TOC)


# ----- Tools -----

# Root directory
ROOT = $(shell pwd)

# Base commands
PYTHON = python3.6                        # specific version for talking to compute cluster
IPYTHON = ipython
JUPYTER = jupyter
JUPYTER_BOOK = jupyter-book
LATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex
SPHINX = sphinx-build
GHP_IMPORT = ghp-import
RSYNC = rsync
GHOSTSCRIPT = gs
PIP = pip
VIRTUALENV = $(PYTHON) -m venv
ACTIVATE = . $(VENV)/bin/activate
INKSCAPE = inkscape
CONVERT = convert
TR = tr
CAT = cat
SED = sed
RM = rm -fr
CP = cp
CHDIR = cd
MKDIR = mkdir -p
ZIP = zip -r
UNZIP = unzip
WGET = wget
ECHO = echo

# Datestamp
DATE = `date`

# Requirements and venv
VENV = venv3
REQUIREMENTS = requirements.txt

# Jupyter Book construction
BUILD_DIR = _build
SRC_DIR = src
BOOK_DIR = bookdir
BOOK_BUILD_DIR = $(BOOK_DIR)/$(BUILD_DIR)


WGET = wget
ECHO = echo

# Datestamp
DATE = `date`

# Requirements and venv
VENV = venv3
REQUIREMENTS = requirements.txt

# Jupyter Book construction
BUILD_DIR = _build
SRC_DIR = src
BOOK_DIR = bookdir
BOOK_BUILD_DIR = $(BOOK_DIR)/$(BUILD_DIR)

# LaTeX construction
LATEX_BUILD_DIR = $(BOOK_BUILD_DIR)/latex
LATEX_BOOK_STEM = em-book
LATEX_BOOK = $(LATEX_BOOK_STEM).tex
LATEX_BOOK_PDF = $(LATEX_BOOK_STEM).pdf

# Epub construction
EPUB_BUILD_DIR = $(BOOK_BUILD_DIR)/epub

# Commands
RUN_SERVER = PYTHONPATH=. $(JUPYTER) lab
CREATE_BOOK = $(JUPYTER_BOOK) create $(BOOK_DIR)
BUILD_BOOK = $(JUPYTER_BOOK) build $(BOOK_DIR)
UPLOAD_BOOK = $(GHP_IMPORT) -n -p -f $(BOOK_BUILD_DIR)/html
BUILD_PRINT_BOOK = $(SPHINX) -b latex -c $(ROOT)/latex . $(BUILD_DIR)/latex
BUILD_BIBLIOGRAPHY = $(BIBTEX) $(LATEX_BOOK_STEM)
BUILD_INDEX = $(MAKEINDEX) $(LATEX_BOOK_STEM)
BUILD_EPUB_BOOK = $(SPHINX) -b epub -c $(ROOT)/epub . $(BUILD_DIR)/epub


# ----- Top-level targets -----

# Default prints a help message
help:
	@make usage

# Run the notebook server
live: env
	$(ACTIVATE) && $(RUN_SERVER)

# Build HTML
book: env bookdir $(CONTENT)
	$(RM) $(BOOK_BUILD_DIR)/jupyter_execute
	$(RSYNC) $(CONTENT) $(BOOK_DIR)
	$(ACTIVATE) && $(BUILD_BOOK)

bookdir: $(BOOK_DIR)

$(BOOK_DIR): Makefile $(BOOK_CONFIG)
	$(RM) $(BOOK_DIR)
	$(ACTIVATE) && $(CREATE_BOOK)
	$(RM) $(BOOK_DIR)/*.ipynb $(BOOK_DIR)/*.md

# Upload book to public web site
upload: book
	$(ACTIVATE) && $(UPLOAD_BOOK)

# Build a development venv
.PHONY: env
env: $(VENV)

$(VENV):
	$(VIRTUALENV) $(VENV)
	$(ACTIVATE) && $(PIP) install -r requirements.txt


# Clean up the build
clean:
	$(RM) $(BOOK_DIR) $(GENERATED_IMAGES)

# Clean up everything, including the venv (which is quite expensive to rebuild)
reallyclean: clean
	$(RM) $(VENV)


# ----- Construction rules -----

.SUFFIXES: .svg .pdf .png .ipynb .html .md .rst

.svg.pdf:
	$(INKSCAPE) $*.svg --export-pdf=$*.pdf

.svg.png:
	$(CONVERT) $*.svg $*.png


# ----- Usage -----

define HELP_MESSAGE
Editing:
   make live         run the notebook server

Maintenance:
   make book         build the book using Jupyter Book
   make upload       upload book to public web site
   make print        build a PDF of the book for printing

Maintenance:
   make env          create a virtual environment
   make clean        clean-up the build
   make reallyclean  delete the venv as well

endef
export HELP_MESSAGE

usage:
	@echo "$$HELP_MESSAGE"


