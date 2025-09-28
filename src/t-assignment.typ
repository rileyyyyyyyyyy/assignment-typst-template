#let questionCounter = counter("questionCounter")


#let assignment(
  title: none,
  subject: none,
  name: none,
  studentId: none,
  email: none,
  doc
) = {
  set text(region: "AU") // AU region for proofing
  
  // set page size
  set page(
    paper: "a4"
  )

  // create title page
  align(center + horizon)[
    #par(leading: 1.25em)[
      // assignment title
      #text(
        size: 28pt,
        weight: "bold"
      )[
        #title
      ]\
      // subject
      #text(
        size: 14pt,
        weight: "medium"
      )[
        #subject
      ]
    ]
    // student name, id and email address
    #text(11pt)[
      #name\
      #studentId\
      #link("mailto:" + email)
    ]
  ]

  // page numbers start at 1 after title page
  pagebreak(weak: true)
  counter(page).update(1)

  // gets the page number to use in footer
  let pagen = context(counter(page).display())

  set page(
    // sets page header
    header: align()[
      #set text(
        fill: luma(80)
      )
      #title #h(1fr) #subject
    ],
    // sets page footer
    footer: align(center)[
      #set text(
        fill: luma(80)
      )
      #pagen
    ],
    // sets a 1 inch margin on all sides
    margin: (x: 1in, y: 1in),
  )

  // makes paragraphs justified
  set par(
    justify: true
  )

  // adds a 1em gap under headings
  show heading: set block(below: 1em)

  // starts question numbering at 1
  counter("questionCounter").update(1)
  
  doc
}


// question component
#let question(questionText) = [
  #pagebreak(weak: true)

  // get and display counter for automatic question numbering
  #let questionNumber = context(counter("questionCounter").display())
  = Question #questionNumber
  #questionCounter.step() // increment question number

  // make question text italic and add spacing after
  #text(style: "italic")[
    #questionText
    #v(1em)
  ]
]
