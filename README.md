# LaTeX DFG template 

A LaTeX template for a basic DFG (Deutsche Forschungsgemeinschaft, German Research Foundation) grant proposal.

## Acknowledgements

This template is based on the template of the [Measurement Engineering
Group](https://github.com/emtpb/proposal_dfg) and is based on the current RTF
[DFG form
53.10](http://www.dfg.de/foerderung/programme/einzelfoerderung/sachbeihilfe/formulare_merkblaetter/index.jsp).

## Compilation

    pdflatex
    biber
    pdflatex
    pdflatex

or

    make

## Customization

Most of customization (citation style, etc.) can be done by changes in the `proposal.sty`.

## Bibliography

To add references to different parts of the proposal, you can define categories:

    \DeclareBibliographyCategory{reviewed}
    \addtocategory{reviewed}{Hoelzer:16}

that can be later used in the sections:

    \printbibliography[category=reviewed, heading=none]

## Sum up costs

The environment `funds` can be used to automatically sum up all costs specified like this:

    \begin{funds}[funding for staff]

    \positionmul{Research associate, TV-L 13, 36 months}{5375}{36}
    \positionmul{Student assistant, TV-L 13, 12 months}{450}{12}

    \end{funds}

## Disclaimer

I used this template for an actual proposal submission to the DFG that was accepted and send out for review. Just be aware of the 20 pages maximum... -.- 
