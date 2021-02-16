# LaTeX DFG template 

__Last updated: August 2020__

A LaTeX template for a basic DFG (Deutsche Forschungsgemeinschaft, German Research Foundation) grant proposal. __Attention__: you need ``pdflatex`` and ``biber`` (not ``bibtex``) to compile the document. 

## Acknowledgements

This template is based on the template of the [Measurement Engineering
Group](https://github.com/emtpb/proposal_dfg) and based on the RTF
[DFG form 53_01_en 04/20](http://www.dfg.de/formulare/53_01_elan/53_01_en_elan.rtf), __last accessed in August 2020__.

Thanks to [@nneuss](https://github.com/nneuss) a German version is also available. Please use `dfg-german.tex` instead of `dfg.tex` for the German version. 

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

You can also change the filename of the `${NAME}.tex` file and then run `make filename=${NAME}` (thx [@dl1chb](https://github.com/dl1chb)). For example, to compile the German version: 

```
make filename=dfg-german
```

### Biber

If you do not have ``biber`` installed try to install it from the package sources of your system. There is also a ``conda`` install that you can try:

```bash
conda create -n biber -c malramsay biber 
conda activate biber
```

## ToDo-Notes and reference labels
By default the todonotes package is enabled. You can see it working by looking at the \todo[inline]{foo} statements in the text. It is self-explaining.

In addition you will se some labels at the margins. These are caused by another plugin which will just print the name of the label stated in `\label{}`. This can help by referencing sections and stuff.

To turn both of them off (e.g. for the final version) jsut change `\setboolean{finalcompile}{false}` in dfg.tex to `\setboolean{finalcompile}{true}`.

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

I used this template for an actual proposal submission in 2019 to the DFG that was accepted and send out for review (unfortunately, not accepted in the end). 

If you use this template and receive a confirmation, please let me know and I will be happy to reference your successful application here! :)

Furthermore, please be aware that since May 2020 the proposal is split into a more research focused part (sections 1-4, max. 15 pages) and all the supplementary information (starting section 5, max. 10 pages). Please also always check if there are any changes to the [DFG template](https://www.dfg.de/foerderung/programme/einzelfoerderung/sachbeihilfe/formulare_merkblaetter/index.jsp)!


