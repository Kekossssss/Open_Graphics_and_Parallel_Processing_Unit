//----------------------------------------------------------//
//----------------------------------------------------------//
//Parameters to change
#let logo_1 = "pictures/placeholder.png"
#let logo_2 = "pictures/placeholder.png"
#let logo_1_description = [Placeholder]
#let logo_2_description = [Placeholder]
#let title = [*Architecture Specification\ Open Graphics and Parallel Processing Unit*]
#let revision = [0.1]
#let revision_date = [03/08/2026]
#let version_name = [*Architecture Specification (W.I.P)*]
#let author_name = "GUILLOUX Kévin"
//----------------------------------------------------------//
//----------------------------------------------------------//

//Top Logos
#grid(
  columns: (auto, 1fr, auto),
  align: center,
  image(logo_1, height: 6em, alt: "Logo 1"),
  "",
  image(logo_2, height: 6em, alt: "Logo 2"),
  logo_1_description,
  "",
  logo_2_description,
)


//Title
#align(center + horizon, {
  line(length:100%, stroke:2pt)
  v(10pt)
  text(20pt, title)
  v(10pt)
  line(length:100%, stroke:2pt)
  v(10pt)
  [Version #revision : #revision_date]
})


#align(bottom, {
  underline(align(center)[#version_name])
  v(20pt)
  align(center)[#author_name]
  v(50pt)
  figure(
    table(
      columns: (3),
      [Version], [Date]      , [Revision description],
      [V0.1]   , [03/08/2026], [Initial version, backbone and first architecture drafts],
    ),
    caption: [Revision history]
  )
})