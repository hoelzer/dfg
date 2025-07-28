# LaTeX DFG template 

A LaTeX template for a basic DFG (Deutsche Forschungsgemeinschaft, German Research Foundation) grant proposal. __Attention__: you need ``pdflatex`` and ``biber`` (not ``bibtex``) to compile the document. **Last updated according to the DFG original template listed in the header of the compiled PDF file (or in the `*.tex` files). Please check and open an issue if there are any updates to the original template not reflected here!**

## Acknowledgements

This template is based on the template of the [Measurement Engineering Group](https://github.com/emtpb/proposal_dfg) and mimicks the RTF template and PDF guidelines provided by [DFG with a focus on a "Sachbeihilfe" grant](https://www.dfg.de/foerderung/programme/einzelfoerderung/sachbeihilfe/formulare_merkblaetter/index.jsp). 

Thanks [@FPK](https://github.com/FPK) for suggesting and adding the [cleveref package](https://www.namsu.de/Extra/pakete/Cleveref.html). Check the [manual](https://www.namsu.de/Extra/pakete/Cleveref.html) and use `\cref{}` instead of the default `\ref` for referencing your figures, tables, etc. General changes regarding lables can be done in the `Header.tex`. Also thanks for further customization fixes (typos, german translation, nicer font for numbers). 

Thanks [@nneuss](https://github.com/nneuss) a German version is also available. Please use `dfg-german.tex` instead of `dfg.tex` for the German version.

Thanks [@dl1chb](https://github.com/dl1chb) for better ToDo handling via the [todonotes package](https://www.ctan.org/pkg/todonotes) and updates of the template.

Thanks [@mank4](https://github.com/mank4) for the implementation of a gantt chart and better handling of subsections for work packages.

Thanks [@klb2](https://github.com/klb2/dfg-proposal-template) for the implementation of consecutive section numbers for 1.2.1 and 1.2.2. *Deprecated* since DFG template version 54.01 09/22 where references are only listed in Section 3. 

Thanks [@gituser789](https://github.com/gituser789) for the implementation of an own literature feature with separate numbering. 

Thanks [@kss-lea](https://github.com/kss-lea) for adding separate numbering formats for the first and second (supplement) part. 

Thanks [@klb2](https://github.com/klb2), [@FPK](https://github.com/FPK), and [@wallscheid](https://github.com/wallscheid) for updates to the new `DFG-form 53.01 - 03/24` version.

Thanks [@nise](https://github.com/nise) and [@ThiloKr](https://github.com/ThiloKr) for the [suggested changes to make author publications bold](https://github.com/hoelzer/dfg/issues/47) and [@shervinsafavi](https://github.com/shervinsafavi) for the PR implementing them.

Thanks [@wallscheid](https://github.com/wallscheid) for adding an english CV [according to 53.200 – 03/23 DFG form](https://www.dfg.de/de/formulare-53-200-elan-246806). Please note that this CV needs to be additionally compiled via `pdflatex` if you want to use it.

_Please let me know if I accidentally forgot a contribution! Thanks all contributors!_

## Successful applications with the template

If you use this template and receive confirmation, please let me know so that I can mention your successful application here!

* Prof. Dr. Maximilian E. Schüle ([@MaxEmanuel](https://github.com/MaxEmanuel)), "Functions Become Data: Higher-Order Lambda Functions for Database Systems" (2025)

## Compilation

```bash
pdflatex
biber
pdflatex
pdflatex
```
or

```bash
make
```

You can also change the filename of the `${NAME}.tex` file and then run `make filename=${NAME}` (thx [@dl1chb](https://github.com/dl1chb)). For example, to compile the German version: 

```bash
make filename=dfg-german
```

**Please note** that this will only compile the main grant document. If you want to also use the DFG CV document, you need to additionally compile the corresponding tex file, e.g. via `pdflatex CV-dfg.tex`.

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

## Optional content

The template implements some stuff that is not required by the original DFG template (or even needs to be removed when submitting to DFG). This includes a nice title page, as well as sections for a Signature and a List of Attachements. The LaTeX code is still available, just uncomment in the respective `dfg.tex` or `dfg-german.tex`. 

## ToDo-Notes, reference labels and draft mode
By default, ToDos and labels are activated (see below) which is considered the _draft_ mode of the template. To turn both of them off (e.g. for the final version) just change `\setboolean{finalcompile}{false}` in dfg.tex to `\setboolean{finalcompile}{true}`.

ToDos are activated by default using the `todonotes` package. You can see it working by looking at the `\todo[inline]{foo}` statements in the text. It is self-explaining.

In addition you will see some labels at the margins. These are caused by another plugin which will just print the name of the label stated in `\label{}`. This can help by referencing sections and stuff.

## Customization

Most of customization (citation style, etc.) can be done by changes in the `proposal.sty`. To change the default labels for referencing figures and tables (e.g. "Abbildung" for a figure in the german layout), look in the `Header.tex` file. Since v3.0.0 of the template the [cleveref](https://www.namsu.de/Extra/pakete/Cleveref.html) package is used replacing the standard `\ref` with the `\cref` command.

## Bibliography 

**deprecated since DFG template version 54.01 09/22. All literature is listed in Section 3 now.**

To add references to different parts of the proposal, you can define categories:

```latex
\DeclareBibliographyCategory{reviewed}
\addtocategory{reviewed}{Hoelzer:16}
```

that can be later used in the sections:

```latex
\printbibliography[category=reviewed, heading=none]
```

Recently, the DFG changed their template to have references in the sections 1.2.1 and 1.2.2 sorted consecutively. For other references in the bibliography, it seems that one can arrange them alphabetically. This was solved by [@klb2](https://github.com/klb2/dfg-proposal-template) and changes were also included in this repo (thx!). The current default is numeric labels while first the references in sections 1.2.1 and 1.2.2 are numbered followed by all other references in the order how they appear in the text. Changes can be done via the `proposal.sty` file. [@gituser789](https://github.com/gituser789) also implemented a feature to number own references and all other references independently. This is activated by default and will add an 'O' or 'E' prefix to own ("eigene") literature in the english or german template, respectively. The user can change the prefix in the tex template. If you want to deactivate this feature, go to the tex template and comment/remove __both__ `\newrefcontext[labelprefix=]` commands. 

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

### Highlight author's publications

It is recommended to higlight author publications. This can be done using **bold** font. Go to the `Header.tex` file and add the bib keys of the publications you want to highlight to this code section:

```tex
\addtocategory{important}{%
Hoelzer:16,Hoelzer:17,Smith2023b,Smith2023c,Smith2023d,MIller1900, % don't miss the comma after the last entry
}
```

The listed publications will be written in bold in the reference list. The citations in the text will be also bold. Change the behavior in the `proposal.sty` file if necessary.

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

This LaTeX template is an unofficial offer provided for convenience when preparing grant proposals for the Deutsche Forschungsgemeinschaft (DFG). It is based on the structure and formatting of the original Microsoft Word template made available by the DFG but is not affiliated with, endorsed by, or officially supported by the DFG.

Users are responsible for ensuring their submission complies with the most recent DFG guidelines. Please refer to the DFG's official website and documentation for authoritative and up-to-date information.

Use at your own discretion.

Furthermore, be aware that since May 2020 the proposal is split into a more research focused part (sections 1-3, max. 17 pages) and all the supplementary information (starting section 4, max. 8 pages). Please also always check if there are any changes to the [DFG template](https://www.dfg.de/foerderung/programme/einzelfoerderung/sachbeihilfe/formulare_merkblaetter/index.jsp)!


