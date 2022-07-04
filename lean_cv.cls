\ProvidesClass{lean_cv}[2018/12/25 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%--------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%--------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline[linecolor=white]{->}(#1,0)\endpspicture}
\RequirePackage{pstricks}
\defaultfontfeatures{
		Path = /usr/local/texlive/2021/texmf-dist/fonts/opentype/public/fontawesome/ }
\RequirePackage{fontawesome}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{array,booktabs}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{tabularx}
\RequirePackage{setspace}
\RequirePackage{calrsfs} % for caligraphy 

\RequirePackage{enumitem}
\RequirePackage{setspace}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
		pdftitle={},
		pdfauthor={},
		pdfsubject={},
		pdfkeywords={},
		colorlinks=false,           % no lik border color
		allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
	\RequirePackage{letltxmacro}
	\setlength{\XeTeXLinkMargin}{1pt}
	\LetLtxMacro\SavedIncludeGraphics\includegraphics
	\def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
		\IncludeGraphicsAux{#1}%
	}%
	\newcommand*{\IncludeGraphicsAux}[2]{%
		\XeTeXLinkBox{%
			\SavedIncludeGraphics#1{#2}%
		}%
	}%
\fi

% ===== custom packages included ======
\RequirePackage{visualizations}
\RequirePackage{timeline}
%--------------------------------------------------------------------------------
%	 COLOURS
%--------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{ffffff}
\definecolor{headingcolor}{HTML}{000000}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{topcolor}{HTML}{7cbb00}


\definecolor{microsoft_blue}{HTML}{00a1f1}
\definecolor{microsoft_yellow}{HTML}{ffbb00}
\definecolor{microsoft_green}{HTML}{7cbb00}
\definecolor{microsoft_red}{HTML}{f65314}

\definecolor{custom_grey}{HTML}{808080}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}

\ifdefined\@cv@print
	\colorlet{green}{gray}
	\colorlet{orange}{gray}
	\colorlet{purple}{gray}
	\colorlet{red}{gray}
	\colorlet{blue}{gray}
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
\else
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%--------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%--------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

\DeclareMathAlphabet{\pazocal}{OMS}{zplm}{m}{n} % declare alphabet for caligraphy

% -------------------------------------------------------------------------------
% 	FONTS
%--------------------------------------------------------------------------------

\newfontfamily\headingfont[Path = fonts/]{segoeuib.ttf} %TODO: add the microsoft font here


%--------
%%% ==> Hint: A4 dimensions:  width: 21.0, height: 29.7
%--------

%--------------------------------------------------------------------------------
%	TOPBAR DEFINTIONS
%	Here are placed all the new commands to host topbar information
%--------------------------------------------------------------------------------

\setlength{\TPHorizModule}{2cm} % Left margin
\setlength{\TPVertModule}{2cm} % Top margin

% Define custom commands for CV info
\newcommand{\initials}[1]{
	\renewcommand{\initials}{
	\hspace{4mm} \textcolor{black}{#1}}} % the initials of your name in case of no profile pic

\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}

\newlength\cvPictureWidth
\setlength\cvPictureWidth{3.0cm} %TODO: think about repositioning this specific one
\newcommand{\cvpic}[1]{
	\renewcommand{\cvpic}{
		\ifthenelse{\equal{#1}{}}{ % if profile pic is not defined
				\begin{tikzpicture}
					\node[circle, opacity=0.7, fill=custom_grey, minimum size=\cvPictureWidth] {
					\huge $\pazocal{\initials}$};
				\end{tikzpicture}		
			}{ % profile pic is defined
				\begin{tikzpicture}
					\node[
					circle,
					minimum size=\cvPictureWidth,
					path picture={
						\node at (path picture bounding box.center){
						\includegraphics[width=\cvPictureWidth]{#1} % this is the path of the image
						};
					}]
					{};
				\end{tikzpicture}
		}
	}
}

%\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand {\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}


% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

%--------------------------------------------------------------------------------
%	TOPBAR LAYOUT
%--------------------------------------------------------------------------------

\newcommand{\makeheader}{
	%\begin{tikzpicture}[remember picture, overlay]
	%	\node [rectangle, fill=topcolor, anchor=north east, minimum width=\paperwidth+5cm, minimum height=4cm] (box) at (21 cm, 5cm){
	%		% No node title goes here
	%	};
	%\end{tikzpicture}

	% 	LAYOUT CODE IS GOING HERE
	% -----------------------------------------------
	%\includegraphics[width=0.5\textwidth]{profile_pic}
	%------------------------------------------------

	\begin{textblock}{3}(1.5, 0.1)
		\cvpic
	\end{textblock}

	\begin{textblock}{7}(5.3, 0.3) % the arguments are: {hsize}{hpos, vpos} - h stands for horizontal
		\begin{spacing}{1.5}
			%------------------------------------------------
			{\LARGE\color{black}\textbf{\cvname}} \\
			%------------------------------------------------
			{\Large\color{custom_grey!80}\cvjobtitle}
		\end{spacing}
		%\hrule
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	SIDEBAR DEFINITIONS
%	Here are placed all the new commands to host sidebar informations
%----------------------------------------------------------------------------------------
\setlength{\TPHorizModule}{2cm} % Left margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\sidebarsection}[2]{\vspace{3pt}{\color{black!80} \Large #1 \rule[0.15\baselineskip]{#2}{1pt}}}


\newcommand\interests[1]{
	\renewcommand{\interests}{
		{#1}
	}
}

%--------------------------------------------------------------------------------
%	SIDEBAR LAYOUT
%--------------------------------------------------------------------------------

\newcommand{\makesidebar}{
	%\begin{tikzpicture}[remember picture, overlay]
	%	\node [rectangle, fill=microsoft_blue, anchor=north, minimum width=10cm, minimum height=\paperheight+1cm] (box) at (0cm, 10cm){};
	%\end{tikzpicture}

	% ------ CONTACT INFO SEGMENT -----------
	\begin{textblock}{6}(15, 0.1)
		\sidebarsection{Contact info}{0cm} \\ \\ %2cm
		\renewcommand{\arraystretch}{1.4} % this is to add some extra space betweeen rows
		\begin{tabular}{l l} % p{1cm} @{\hskip 0.5cm}p{5cm}
			\ifthenelse{\equal{\cvnumberphone} {} } {}{ %{ condition }{ then clause }{ else clause }
						{$
							\begin{array}{l}
							\hspace{1mm} \LARGE \color{custom_grey}\textnormal{{\faMobile}}
							\end{array}
							$} & {\textcolor{black}{\cvnumberphone}} \\ } 
			\ifthenelse{\equal{\cvsite}{}}{}{
						{$
							\begin{array}{l}
							\hspace{1mm} \large \color{custom_grey}\textnormal{{\faGlobe}}
							\end{array}
							$} &
							\href{https://\cvsite}{\color{black}\cvsite}
						\\ }
			\ifthenelse{\equal{\cvmail}{}}{}{
						
						{$
							\begin{array}{l}
							\hspace{0mm} \large \color{custom_grey}\textnormal{{\faEnvelopeO}}
							\end{array}
							$} & \href{mailto:\cvmail}{\color{black}\cvmail}
						 \\ }
			\ifthenelse{\equal{\cvlinkedin}{}}{}{
						{$
							\begin{array}{l}
							\hspace{1mm} \large \color{custom_grey}\textnormal{{\faLinkedin}}
							\end{array}
							$} & \href{https://www.linkedin.com\cvlinkedin}{\color{black}\cvlinkedin}
							\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{
						{$
							\begin{array}{l}
							\hspace{1mm} \large \color{custom_grey}\textnormal{\faGithub}
							\end{array}
							$} & \href{https://www.github.com/\cvgithub}{\color{black}\cvgithub}
						}
		\end{tabular}

		% ------ SOFT SKILLS INFO SEGMENT -----------
		\sidebarsection{Skills}{0cm} %3.8cm

		{\large \color{black}\textbf{Fields of interest}}
		%TODO: the following should be wrapped in a proper function and not to be hard coded

		\begin{minipage}{\textwidth}
			\cubeviz
		\end{minipage}
		

		\vspace{2mm}
		
		{\large \color{black}\textbf{Technical}}

		%\color{black} \programming
		\hboxes

		\vspace{2mm}
		%FIXME: this is for US for EU we have the A,B,C .. etc.
		\sidebarsection{Languages (ILR scale)}{0cm} %{2.4cm}}

		\vboxes

		\sidebarsection{Sports}{0cm} %{2.9cm}
		
		\infogrid

	\end{textblock}
}


%--------------------------------------------------------------------------------
%	MAIN BODY DEFINTIONS
%--------------------------------------------------------------------------------

\newcommand {\manifesto}[1] {\renewcommand{\manifesto}{#1}}

%TODO: ==> experience should be loaded from a source file in a list format
%TODO: ==> education should be loaded from a source file in list format as well
%TODO: ==> Awards and certifications

%--------------------------------------------------------------------------------
%	MAIN BODY LAYOUT
%--------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % defining the units of horizontal positioning system

\newcommand{\makebody}{
	% main body dynamic content generation
	\begin{textblock}{12}(0.6, 1.8)
		\begin{itemize}[label={},leftmargin=2em]
			\item \manifesto
		\end{itemize}
		\experience
		\education
        \certsawards
        \publications
	\end{textblock}
    }
\renewcommand{\refname}{\small Major Bibliographic Contributions}
\newcommand{\publications}{
        \nocite{*}
        {\small \bibliography{pubs}}
        \bibliographystyle{ieeetr}
    }