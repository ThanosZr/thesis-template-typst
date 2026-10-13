#import "@preview/icu-datetime:0.2.2" as icu

#let fonts = (
  body: "Libertinus Serif",
  sans: "Libertinus Serif",
)

#let cover(
  title: "",
  program: "",
  author: (),
  division: "",
  teachers: (),
  class: "",
  submissionDate: none,
  city: "Αθήνα",
) = {
  set page(
    margin: (left: 25mm, right: 25mm, top: 20mm, bottom: 25mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body,
    size: 11pt,
    lang: "el",
  )

  set par(leading: 1em)

  // --- Cover (same as titlepage but without committee) ---

  // Header with logo and university info
  grid(
    columns: (45mm, 1fr),
    gutter: 0mm,
    align: center,
    align(center, image("/figures/ntua_logo.svg", width: 30mm)),
    align(left + horizon, block(width: 100%)[
      #set text(top-edge: 2pt)
      #text(font: fonts.sans, size: 12pt, "Εθνικό Μετσόβιο Πολυτεχνείο")

      #text(font: fonts.sans, size: 12pt, "Σχολή Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών")

      #if division != "" { text(size: 12pt, "Τομέας: " + division) }
    ]),
  )

  v(25mm)
  align(center, text(font: fonts.sans, weight: 700, size: 16pt, underline(title)))
  v(10mm)
  align(center, text(font: fonts.sans, size: 16pt, "Εργαστηριακή Αναφορά στο μάθημα"))
  v(2.5mm)
  align(center, text(font: fonts.sans, size: 16pt, weight: 700, class))
  v(10mm)

  align(center, text(font: fonts.sans, size: 14pt, 
  if type(author) == array { "των φοιτητών" } else {"του φοιτητή"}))

  // Author label and name
  align(center, text(font: fonts.sans, weight: 700, size: 14pt,
   [#if type(author) == array { author.join("\n") } else { author }]
  ))

  

  v(25mm)
  // Supervisor section
  text("Διδάσκοντες:\n" + teachers.join(", "), size: 12pt, weight: "bold")
  v(40mm)

  let dateStr = if submissionDate != none { icu.fmt(submissionDate, locale: "el", date-fields: "YMD") } else {
    "Month Year"
  }
  align(center, text(size: 12pt, dateStr))
}

// Simple lab report template, customize to your needs
#let lab_report(
  title: "",
  teachers: (),
  class: "",
  author: (),
  submissionDate: none,
  division: "",
  city: "Αθήνα",
  body,
) = {
  cover(
    title: title,
    author: author,
    division: division,
    teachers: teachers,
    class: class,
    submissionDate: submissionDate,
    city: city,
  )

  // Set the document's basic properties.
  set page(
    "a4",
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "1",
    number-align: center,
  )

  // Set body font family.
  set text(
    font: fonts.body,
    size: 12pt,
    lang: "el",
  )

  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: fonts.body)
  set heading(numbering: "1.1")

  // --- Paragraphs ---
  let firstParagraphIndent = 1.45em
  show heading: it => {
    it
    h(firstParagraphIndent)
  }
  set par(leading: 1em, justify: true, first-line-indent: 2em)

  // --- Citation Style ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)
  show figure.caption: set text(size: 9.2pt)
  show figure.caption: set par(leading: 0.5em)

  body
}
