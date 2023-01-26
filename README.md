# lean_cv
A lean latex cv template. Create your one page personal CV in almost a minute...

Do add all the missing information to build your resume at template.tex
-- To build the resume XeLaTeX is required.

Enjoy your lean CV!

Hint: Cubeviz does not yet support parametric persentage --> the internal polygon is hard coded. Just provide
the axial information you are interested in in an anticlockwise order starting with the axis ending at the top
right corner.

Future work:
1. Include parametric persentage for the cubviz module in the visualizations.sty package
2. Design a smart way to extend textblocks in more pages.
3. Add publications via bibtex in Appendix.

## Things have been updated a little bit thus we need to enlist the install latex setup steps here:

brew install pandoc
brew tap homebrew/cask
brew install --cask basictex
eval "$(/usr/libexec/path_helper)"
# Update $PATH to include `/usr/local/texlive/2022basic/bin/universal-darwin`
sudo tlmgr update --self
sudo tlmgr install texliveonfly
sudo tlmgr install xelatex
sudo tlmgr install adjustbox
sudo tlmgr install tcolorbox
sudo tlmgr install collectbox
sudo tlmgr install ucs
sudo tlmgr install environ
sudo tlmgr install trimspaces
sudo tlmgr install titling
sudo tlmgr install enumitem
sudo tlmgr install rsfs