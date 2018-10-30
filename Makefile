dizz.pdf:
	pdflatex dfg.tex
	biber dfg
	pdflatex dfg.tex
	pdflatex dfg.tex

.PHONY: dfg.pdf

