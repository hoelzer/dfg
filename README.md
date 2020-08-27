# LaTeX DFG template 

__Last updated: August 2020__

A LaTeX template for a basic DFG (Deutsche Forschungsgemeinschaft, German Research Foundation) grant proposal. __Attention__: you need ``pdflatex`` and ``biber`` (not ``bibtex``) to compile the document. 

## Acknowledgements

This template is based on the template of the [Measurement Engineering
Group](https://github.com/emtpb/proposal_dfg) and based on the RTF
[DFG form 53_01_en 04/20](http://www.dfg.de/formulare/53_01_elan/53_01_en_elan.rtf), __last accessed in August 2020__.

## Compilation

```bash
pdflatex
biber
pdflatex
pdflatex
```
or
```
make
```

### Biber

If you do not have ``biber`` installed try to install it from the package sources of your system. There is also a ``conda`` install that you can try:

```bash
conda create -n biber -c malramsay biber 
conda activate biber
```

## Customization

Most of customization (citation style, etc.) can be done by changes in the `proposal.sty`.

## Bibliography

To add references to different parts of the proposal, you can define categories:

```latex
\DeclareBibliographyCategory{reviewed}
\addtocategory{reviewed}{Hoelzer:16}

that can be later used in the sections:

```latex
\printbibliography[category=reviewed, heading=none]
```

### Bib Style

To change the style of your bibliography you have to change the following code snippet in the ``proposal.sty`` file:

```latex
\usepackage[backend = biber,
    style = numeric, %numeric, alphabetic
    firstinits = true,
    natbib = true,
    hyperref = true,
    maxbibnames = 11, % number of authors shown
    sorting=none, % remove this to have things sorted, e.g. use style=alphabetic
    ]{biblatex}
```

## Sum up costs

The environment `funds` can be used to automatically sum up all costs specified like this:

```latex
\begin{funds}[funding for staff]

\positionmul{Research associate, TV-L 13, 36 months}{5375}{36}
\positionmul{Student assistant, TV-L 13, 12 months}{450}{12}

\end{funds}
```

## Disclaimer

I used this template for an actual proposal submission to the DFG that was accepted and send out for review. Just be aware of the 20 pages maximum... -.- 
