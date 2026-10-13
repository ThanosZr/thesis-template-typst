// Texts of the template in English ("en") and Greek ("el").
// The language is chosen with `language` in metadata.typ.

#let strings = (
  en: (
    contents: "Contents",
    chapter: "Chapter",
    figure: "Figure",
    table: "Table",
    list-of-figures: "List of Figures",
    list-of-tables: "List of Tables",
    appendix: "Appendix A: Supplementary Material",
    bibliography: "Bibliography",
    quotes: (single: ("‘", "’"), double: ("“", "”")),
  ),
  el: (
    contents: "Περιεχόμενα",
    chapter: "Κεφάλαιο",
    figure: "Σχήμα",
    table: "Πίνακας",
    list-of-figures: "Κατάλογος Σχημάτων",
    list-of-tables: "Κατάλογος Πινάκων",
    appendix: "Παράρτημα Α: Συμπληρωματικό Υλικό",
    bibliography: "Βιβλιογραφία",
    quotes: (single: ("‘", "’"), double: ("«", "»")),
  ),
)

#let tr(lang, key) = strings.at(lang, default: strings.en).at(key)
