filename=dfg-german

all: dfg-german.pdf clean
dfg-german.pdf:
	pdflatex ${filename}.tex
	biber ${filename}
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex
clean:
	-rm ${filename}.log
	-rm ${filename}.aux
	-rm ${filename}.out
	-rm ${filename}.bbl
	-rm ${filename}.blg
	-rm ${filename}.bcf
	-rm ${filename}.run.xml

.PHONY: dfg-german.pdf
