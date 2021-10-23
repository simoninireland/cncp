# Makefile for "Complex networks, complex processes: A network science miscellany"
#
# Copyright (C) 2021 Simon Dobson <simon.dobson@st-andrews.ac.uk>
#
# Licensed under the Creative Commons Attribution-Share Alike 4.0
# International License (https://creativecommons.org/licenses/by-sa/4.0/).
#

# ----- Sources -----

# Text
INDEX = src/index.md
TEXT = \
	src/preface.md \
	src/zbibliography.md \
	src/about.md \
	src/copyright.md

# Notebooks
NOTEBOOKS =  \
	src/simulation.ipynb \
	src/synchronous.ipynb \
	src/gillespie.ipynb \
	src/cauchy.ipynb \
	src/generating-cdfs.ipynb \
	src/newman-ziff.ipynb

# Image files
RAW_IMAGES = \
	src/sd.png \
	src/cc-by-nc-sa.png

# Generated plots
GENERATED_IMAGES =

# Generated datasets
GENERATED_DATASETS =

# Bibliography
BIBLIOGRAPHY = src/bibliography.bib

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
PYTHON = python3
IPYTHON = ipython
JUPYTER = jupyter
JUPYTER_BOOK = jupyter-book
LATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex
SPHINX = sphinx-build
GHP_IMPORT = ghp-import
GHOSTSCRIPT = gs
PIP = pip
VIRTUALENV = $(PYTHON) -m venv
ACTIVATE = . $(VENV)/bin/activate
RSYNC = rsync
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
KNOWN_GOOD_REQUIREMENTS = known-good-requirements.txt

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
RUN_SERVER = PYTHONPATH=. $(JUPYTER) notebook
CREATE_BOOK = $(JUPYTER_BOOK) create $(BOOK_DIR)
BUILD_BOOK = $(JUPYTER_BOOK) build $(BOOK_DIR)
UPLOAD_BOOK = $(GHP_IMPORT) -n -p -f $(BOOK_BUILD_DIR)/html


# ----- Top-level targets -----

# Default prints a help message
help:
	@make usage

# Run the notebook server
live: env
	$(ACTIVATE)  && $(RUN_SERVER)

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
	$(ACTIVATE) && $(PIP) install -U pip wheel && $(PIP) install -r $(REQUIREMENTS)

# Clean up the build
clean:
	$(RM) $(BOOK_DIR)

# Clean up everything, including the venv (which is quite expensive to rebuild)
reallyclean: clean
	$(RM) $(VENV)


# ----- Usage -----

define HELP_MESSAGE
Editing:
   make live         run the notebook server

Production:
   make book         build the book using Jupyter Book
   make upload       upload book to public web site

Maintenance:
   make env          create a virtual environment
   make clean        clean-up the build
   make reallyclean  delete the venv as well

endef
export HELP_MESSAGE

usage:
	@echo "$$HELP_MESSAGE"
