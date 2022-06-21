# LaTeX DFG template 

__Last updated according to the DFG original template: June 2022__

A LaTeX template for a basic DFG (Deutsche Forschungsgemeinschaft, German Research Foundation) grant proposal. __Attention__: you need ``pdflatex`` and ``biber`` (not ``bibtex``) to compile the document. 

## Acknowledgements

This template is based on the template of the [Measurement Engineering Group](https://github.com/emtpb/proposal_dfg) and based on the RTF [DFG form 53_01_en 11/20](http://www.dfg.de/formulare/53_01_elan/53_01_en_elan.rtf), __last accessed in February 2021__.

Thanks to [@nneuss](https://github.com/nneuss) a German version is also available. Please use `dfg-german.tex` instead of `dfg.tex` for the German version. The german version is based on [DFG form 53.01 elan 03/22](https://www.dfg.de/formulare/53_01_elan/53_01_de_elan.rtf, __last accessed in June 2022__.

Thanks to [@dl1chb](https://github.com/dl1chb) for better ToDo handling via the [todonotes package](https://www.ctan.org/pkg/todonotes) and updates of the template.

Thanks to [@mank4](https://github.com/mank4) for the implementation of a gantt chart and better handling of subsections for work packages.

Thanks to [@klb2](https://github.com/klb2/dfg-proposal-template) for the implementation of consecutive section numbers for 1.2.1 and 1.2.2.

_Please let me know if I accidentally forgot a contribution!_

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

### Docker
You can also use a Docker container that comes with all dependencies (pdflatex, biber, ...) to compile the template. Thus, no installation of LaTeX, Biber, etc... is needed on your local system.

```bash
DOCKER='nanozoo/pdflatex:3.14159265--6263fbd'
docker pull $DOCKER

# using the Makefile
docker run --rm -v $PWD:$PWD -w $PWD $DOCKER make

# using pdflatex, biber, ... 
docker run --rm -v $PWD:$PWD -w $PWD $DOCKER pdflatex dfg.tex
docker run --rm -v $PWD:$PWD -w $PWD $DOCKER biber dfg
...
```

## ToDo-Notes, reference labels and draft mode
By default, ToDos and labels are activated (see below) which is considered the _draft_ mode of the template. To turn both of them off (e.g. for the final version) just change `\setboolean{finalcompile}{false}` in dfg.tex to `\setboolean{finalcompile}{true}`.

ToDos are activated by default using the `todonotes` package. You can see it working by looking at the `\todo[inline]{foo}` statements in the text. It is self-explaining.

In addition you will see some labels at the margins. These are caused by another plugin which will just print the name of the label stated in `\label{}`. This can help by referencing sections and stuff.


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

Recently, the DFG changed their template to have references in the sections 1.2.1 and 1.2.2 sorted consecutively. For other references in the bibliography, it seems that one can arrange them alphabetically. This was solved by [@klb2](https://github.com/klb2/dfg-proposal-template) and changes were also included in this repo (thx!). The current default is numeric labels while first the references in sections 1.2.1 and 1.2.2 are numbered followed by all other references in the order how they appear in the text. Changes can be done via the `proposal.sty` file.

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

## Gantt chart

You will find a `gantt/gantt.tex` file that can be modified directly to include a gantt chart in your proposal.  

## Disclaimer

I used this template for an actual proposal submission in 2019 to the DFG that was accepted and send out for review (unfortunately, not accepted in the end). 

If you use this template and receive a confirmation, please let me know and I will be happy to reference your successful application here! :)

Furthermore, please be aware that since May 2020 the proposal is split into a more research focused part (sections 1-4, max. 17 pages) and all the supplementary information (starting section 5, max. 8 pages). Please also always check if there are any changes to the [DFG template](https://www.dfg.de/foerderung/programme/einzelfoerderung/sachbeihilfe/formulare_merkblaetter/index.jsp)!


