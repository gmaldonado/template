\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iccmemoria}
%[2013/04/18 v1.0.1 Estilo Avance de Memoria de Titulo - ICC - UTalca (C. Astudillo, G. Maldonado)] 
%Ultimos cambios:
%Solo un peque�o cambio en el formato bibliogr�fico para permitir abreviaciones autom�ticas en los nombres de pila.
%desde esta versi�n, el formato se encuetra disponible publicamente en un servidor con control de versiones.

%old versions
%[2005/01/19 v1 Estilo Memoria de Titulo - ICC - UTalca (fmeza, jperez)] 

\PassOptionsToClass{12pt,oneside,fleqn,spanish}{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

\RequirePackage[latin1]{inputenc}
\RequirePackage[english,spanish]{babel}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{url}
\RequirePackage{hyperref}
\decimalpoint

\selectlanguage{spanish}
\bibliographystyle{abbrv}

\def\utalca{Universidad de Talca}
\def\facdeing{Facultad de Ingenier\'{\i}a}
\def\escdeicc{Escuela de Ingenier\'{\i}a Civil en Computaci\'{o}n}
\def\ciudad{Curic\'{o}}
\def\pais{Chile}

\def\dedicaname{Dedicatoria}
\def\agradename{Agradecimientos}
\def\resumenname{Resumen}
\def\Abstractname{Abstract}
\def\tblcontname{Tabla de Contenidos}
\def\indfigname{�ndice de Figuras}
\def\indtblname{�ndice de Tablas}
\def\glosname{Glosario}
\def\appendixpartname{Anexos}

\def\supervisor#1{\def\@supervisor{#1}}
\def\informantes#1#2{\def\@informantex{#1}\def\@informantey{#2}}
\def\adicional#1{\def\@adicional{#1}}
\def\director#1{\def\@director{#1}}
\def\titulo#1{\def\@titulo{#1}}

%%%
% Redimensi�n de m�rgenes
%%%

\setlength\paperheight{11in}  %
\setlength\paperwidth{8.5in}  %
\special{papersize=8.5in,11in}

\newdimen\realleftmargin
\newdimen\realrightmargin
\newdimen\realtopmargin
\newdimen\realbottommargin
\newdimen\realheadpos

\realtopmargin    = 4cm
\realleftmargin   = 4cm
\realbottommargin = 2.5cm
\realrightmargin  = 2.5cm
\realheadpos      = 1.5cm

\setlength\oddsidemargin   {\realleftmargin}
\addtolength\oddsidemargin {-1in}

\setlength\textheight{\paperheight}
  \addtolength\textheight {-\realtopmargin}
  \addtolength\textheight {-\realbottommargin}

\setlength\textwidth{\paperwidth}
 \addtolength\textwidth {-\realleftmargin}
 \addtolength\textwidth {-\realrightmargin}

\setlength\topmargin{\realheadpos}
 \addtolength\topmargin {-1in}

\setlength\headsep{\realtopmargin}
 \addtolength\headsep{-\realheadpos}
 \addtolength\headsep{-\headheight}

%%%
% Definiciones para la tapa
%%%

\def\makeencabezado
{
\begin{center}
\onehalfspacing
{\large\bf\MakeUppercase{\utalca}} \\
{\large\MakeUppercase{\facdeing}} \\
{\large\MakeUppercase{\escdeicc}}
\end{center}
\singlespacing
}

\def\logo
{
\begin{center}
\resizebox{2.5cm}{2.2cm}{\includegraphics{logo.eps}}
\end{center}
}

\def\ingcivil
{
\singlespacing
\parbox{180pt}{
%\MakeUppercase{
Memoria para optar al t�tulo de Ingeniero Civil en Computaci�n\\}%} \\}
}

\def\footdate
{\bigskip
\ciudad~~-- \pais

\@date}

%%%
% PORTADA
%%%

\def\maketitle
{

\singlespacing

% TAPA 

\pagestyle{empty}
\setcounter{page}{-1}
\vspace*{-25mm}

% Logo UTalca
\logo

% Encabezado
\makeencabezado

% T�tulo de la memoria
\bigskip
\begin{center}
  %\onehalfspacing
  {\Large \bf \@titulo\\}  
  %\singlespacing
\end{center}

% Autor
\bigskip
\begin{center}
  {\bf \MakeUppercase{\@author}}
\end{center}

\vfill

\doublespacing
{Profesor Gu\'{i}a: \MakeUppercase{\@supervisor}}
\bigskip
\bigskip
\bigskip

\ingcivil

\footdate

\newpage

% TAPA con profesores

\pagestyle{empty}
\vspace*{-25mm}

% Logo UTalca
\logo

% Encabezado
\makeencabezado

% T�tulo de la memoria
\bigskip
\begin{center}
  {\Large \bf \@titulo\\}  
\end{center}

% Autor
\bigskip
\begin{center}
  {\bf \MakeUppercase{\@author}}
\end{center}

\vfill

\doublespacing
{Profesor Gu\'{i}a: \MakeUppercase{\@supervisor}}
\bigskip

{Profesor Informante: \MakeUppercase{\@informantex}}
\bigskip

{Profesor Informante: \MakeUppercase{\@informantey}}
\bigskip

{\@adicional}
\bigskip
\bigskip
\bigskip

\ingcivil

\footdate

\newpage
\pagestyle{headings} %% de ahora en adelante hay headings en las p�ginas
\onehalfspacing %% de ahora en adelante la separacion es de l�nea y 1/2
}

%%%
% Dedicatoria
%%%

\newenvironment{dedicatory}{
  \addcontentsline{toc}{chapter}{\dedicaname}
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \hbox{}\vskip 400\p@
  \flushright
  \itshape %% en it�lica
  }{
  \normalfont %% vuelve a font normal
  \endflushright
  
  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
}

%%%
% Agradecimientos
%%%

\newenvironment{acknowledgment}{
  \addcontentsline{toc}{chapter}{\agradename}
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \centerline{\bf\MakeUppercase{\agradename}}
  \onehalfspacing
  \vskip 2.5em
  }
  {

  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
}

%%%
% Resumen
%%%

\newenvironment{resumen}{
  \addcontentsline{toc}{chapter}{\resumenname}
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \centerline{\bf\MakeUppercase{\resumenname}}%
  \onehalfspacing
  \vskip 2.5em
  }{
  
  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
}

%%%
% Abstract
%%%

\renewenvironment{abstract}{
  \addcontentsline{toc}{chapter}{\Abstractname}
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \centerline{\bf\MakeUppercase{\Abstractname}}
  \selectlanguage{english}
  \onehalfspacing
  \vskip 2.5em
  }{
  \selectlanguage{spanish}
  
  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

%%%
% Table of Contents
%%%

\renewcommand\tableofcontents{
  \addcontentsline{toc}{chapter}{\tblcontname}	%% agrega la entrada al toc
  \onehalfspacing	%% setea el espacio para el toc
  \def\thepage{\csname @roman\endcsname \c@page} %% define el estilo de numeraci�n 
  \thispagestyle{plain} %% estilo de la p�gina
  \centerline{\bf\MakeUppercase{\tblcontname}} %% escribe \tblcontname
  \begin{flushright} \pagename \end{flushright} %% escribe \pagename
  \par 
  \@starttoc{toc} %% abre el archivo y escribe el toc
  
  \newpage %% nueva p�gina
  \def\thepage{\csname @arabic\endcsname \c@page} %% por si no hay mas inicio
}

%%%
% List of Figures
%%%

\renewcommand\listoffigures{
  \addcontentsline{toc}{chapter}{\indfigname}
  \onehalfspacing
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \centerline{\bf\MakeUppercase{\indfigname}} 
  \begin{flushright} \pagename \end{flushright}
  \par
  \@starttoc{lof}
  
  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
}

%%%
% List of Tables
%%%

\renewcommand\listoftables{
  \addcontentsline{toc}{chapter}{\indtblname}
  \onehalfspacing
  \def\thepage{\csname @roman\endcsname \c@page}
  \thispagestyle{plain}
  \centerline{\bf\MakeUppercase{\indtblname}}
  \begin{flushright} \pagename \end{flushright}
  \par
  \@starttoc{lot}
  
  \newpage
  \def\thepage{\csname @arabic\endcsname \c@page}
}

%%%
% Formato encabezado cap�tulo
%%%

\def\@makechapterhead#1{%
  \thispagestyle{plain}
  \vspace*{25mm}
  \edef\@svsec{\hbox to 1cm{\thechapter.}\hskip 1em }
  \begingroup \Huge\bf\relax
     \@hangfrom{\hskip \z@\relax\@svsec}
     {\interlinepenalty \@M {#1}\par}%
  \endgroup

  \vspace*{7mm}
  \hrule height 2pt width \textwidth

  \bigskip\bigskip\bigskip
}

\def\section{\@startsection {section}{1}{\z@}
  {-3.5ex plus -1ex minus -.2ex}
  {2.3ex plus .2ex}
  {\normalfont\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}
  {-3.25ex plus-1ex minus-.2ex}
  {1.5ex plus.2ex}
  {\normalfont\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}
  {-3.25ex plus -1ex minus-.2ex}
  {1.5ex plus.2ex}
  {\normalfont\normalsize\bf}}
\def\paragraph{\@startsection
  {paragraph}{4}{\z@}
  {3.25ex plus1ex minus.2ex}
  {-1em}
  {\normalfont\normalsize\bf}}
\def\subparagraph{\@startsection
  {subparagraph}{4}
  {\parindent}
  {3.25ex plus1ex minus .2ex}
  {-1em}
  {\normalfont\normalsize\bf}}

%%%
% Glosario
%%%

\newenvironment{glosario}
{
	\newpage
	\addcontentsline{toc}{chapter}{\glosname}
	\thispagestyle{plain}
	\@mkboth{\MakeUppercase\glosname}{\MakeUppercase\glosname} % marca para los headongs
  \vspace*{26mm}
  {\Huge\bf\relax\noindent {\glosname}\par}
  
  \bigskip\bigskip\bigskip
	\begin{description}
}
{
	\end{description}
}

%%%
% Bibliografia
%%%

\renewenvironment{thebibliography}[1]{
	\newpage
	\addcontentsline{toc}{chapter}{\bibname}
	\thispagestyle{plain}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname} % marca para los headongs
  \vspace*{26mm}
  {\Huge\bf\relax\noindent {\bibname}\par}

  \bigskip\bigskip\bigskip
  
  %%% no tengo idea por qu� pero esto genera la bibliograf�a
  \list
  {\@biblabel{\@arabic\c@enumiv}}
  {\setlength{\leftmargin}{0pt}
  	\@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist
}

%%%
% Anexos
%%%

\def\appendixpart{
  \cleardoublepage
  \thispagestyle{empty}
  \setcounter{chapter}{0}%
  \def\Thechapter{\Alph{chapter}}
  \def\thechapter{\Alph{chapter}}

  \addtocontents{toc}{\protect\contentsline{chapter}{\appendixpartname}{}}
  \addtocontents{lof}%
  {\protect\addvspace{10\p@}}% Adds between-chapter space
  \addtocontents{lot}%
  {\protect\addvspace{10\p@}}% to lists of figs & tables.

  
  \hbox{}\vfil
  \centerline{\Huge \bf \MakeUppercase\appendixpartname}\par
  \vfil\newpage
  \pagestyle{headings}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
\def\appendix{\cleardoublepage
  \setcounter{section}{0}
  \secdef\@appendix\@sappendix}
  
  \def\@appendix[#1]#2{
  \ifnum \c@secnumdepth >-2\relax
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\Thechapter:\hspace{1em}#1}
  \else
  \addcontentsline{toc}{chapter}{#1}
  \fi
  \addtocontents{lof}%
  {\protect\addvspace{10\p@}}% Adds between-chapter space
  \addtocontents{lot}%
  {\protect\addvspace{10\p@}}% to lists of figs & tables.

  \thispagestyle{plain}
  \vspace*{25mm}
  \edef\@svsec{\hbox to 1cm{\thechapter.}\hskip 1em }
  \begingroup \Huge\bf\relax
     \@hangfrom{\hskip \z@\relax\@svsec}
     {\interlinepenalty \@M {#2}\par}%
  \endgroup

  \vspace*{7mm}
  \hrule height 2pt width \textwidth

  \bigskip\bigskip\bigskip
  \@mkboth{\MakeUppercase{\Thechapter:\hspace{1em}#1}}{\MakeUppercase{\Thechapter:\hspace{1em}#1}} % marca para los headings
  }

\def\@sappendix#1{{\centering
    \interlinepenalty \@M
    \Huge \bf
    #1\par}\@endappendix}

\endinput

