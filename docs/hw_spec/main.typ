#import "@preview/glossarium:0.5.8": make-glossary, register-glossary, print-glossary, gls, glspl
#show: make-glossary
//----------------------------------------------------------//
//----------------------------------------------------------//
//Parameters to change
#let logo_1 = "pictures/placeholder.png"
#let logo_2 = "pictures/placeholder.png"
#let text_header = [_Open Graphics and Parallel Processing Unit_]
#let name_header = [OG-PPU]
//----------------------------------------------------------//
//----------------------------------------------------------//

//General parameters for the template
#set page(margin: 25.4mm, paper: "a4")
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#set math.equation(supplement: [Équation], numbering: "(1)")
#show table: set block(breakable: false)
#show link: set text(fill: blue.darken(60%))

#set par(spacing: 1em)
// TODO Use \ for linebreaks

#set text(font: "New Computer Modern", size: 11pt)
#show raw: set text(font: "New Computer Modern Mono", size: 11pt)
#show heading: set block(above: 1.4em, below: 1em)

//Template to include codes, needs to be added to files where code need to be used (not a global variable)
#show raw.where(block: true): c => block(
  fill: luma(230), 
  inset: 5pt,
  radius: 2pt,
  {  
    show raw.line: line => {
      text(fill: black)[#line.number]
      h(1em)
      line.body
    }
  }
)

//Title
#include "title.typ"
#pagebreak()

//Special pages
#context counter(page).update(1)
#set page(
  margin: (top: 30mm, bottom: 25.4mm, x: 15mm),
  paper: "a4",
  header-ascent: 40%,
  header: {
    text_header
    h(1fr)
    name_header
    line(length: 100%, stroke: 0.1em)
  },
  footer: {
    set image(height: 4em)
    line(length: 100%, stroke: 0.1em)
    grid(columns: 3*(1fr,), align: (left, center + horizon, right), inset: -7pt,
      image(logo_1),
      context counter(page).display("i"),
      image(logo_2)
    )
  }
)

// Glossary
#import "Glossary.typ": entry-list
#register-glossary(entry-list)

//Table of contents
#outline(
  title: [Summary],
) <summary>
#pagebreak()

//Sets the parameters for the core of the document
#set heading(numbering: "I.1.a.i")
#set figure(numbering: "1 ")
#set page(
  footer: {
    set image(height: 4em)
    line(length: 100%, stroke: 0.1em)
    grid(columns: 3*(1fr,), align: (left, center + horizon, right), inset: -7pt,
      image(logo_1),
      link(<summary>, context counter(page).display("1")),
      image(logo_2)
    )
  }
)
#context counter(page).update(1)

#show figure.caption: set block(inset: (bottom: .15em))
#show figure.where(kind: "algorithm"): it => it.body

//----------------------------------------------------------//
//----------------------------------------------------------//
//Core of the document

#include "intro.typ"
#pagebreak()

#include "specs.typ"
#pagebreak()

#include "og_ppu.typ"
#pagebreak()

#include "stream_block.typ"
#pagebreak()

#include "stream_core.typ"
#pagebreak()

//----------------------------------------------------------//
//----------------------------------------------------------//

#set heading(numbering: none)
= Glossary <Glossary>
#print-glossary(entry-list, show-all: true, disable-back-references: true)
#pagebreak()

#bibliography(
  "Biblio.bib",
  title: "Bibliography",
  style : "ieee" 
)
#pagebreak()

//Table of images
#outline(
  title: [Figures],
  target: figure.where(kind: image),
)
#pagebreak()

//Table of tables
#outline(
  title: [Tables],
  target: figure.where(kind: table),
)
//----------------------------------------------------------//

#pagebreak()
= Appendix