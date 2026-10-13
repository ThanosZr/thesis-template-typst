#import "/layout/lab_report_template.typ": *


#lab_report(
  title: "Title of the Lab Report",
  teachers: ("Teacher 1", "Teacher 2"),
  author: ("Author0 - AM el676767", "Author1 - AM el424242"), // For 1 author pass a string so the template changes "του φοιτητή" instead of "των φοιτητών"
  submissionDate: datetime.today(),
  division: "Τμήμα (αφήστε κενό για αποκρυψη)",
  city: "Αθήνα",
  class: "Μάθημα",
  {
    "Hello Darkness my old friend"
  },
)

