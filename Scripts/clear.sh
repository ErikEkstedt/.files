#!/bin/bash
find . -maxdepth 3 -regextype gnu-awk -regex "^.*\.(pyc|pyo|bak|swp|aux|log|lof|fls|fdb_latexmk|nav|out|snm|toc|bcf|run\.xml|synctex\.gz|blg|bbl)" -delete
