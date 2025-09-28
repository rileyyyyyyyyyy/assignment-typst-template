# Typst template for assignments

A simple Typst template for my university assignment write ups.

## How to use the template

#### Setting up the document:

```typ
#import "t-assignment.typ": *

#show: assignment.with(
  title: "Assignment 1",
  subject: "Vector Calculus",
  name: "Riley",
  studentId: "1234567",
  email: "riley@email.com",
)
```


#### For automatically numbered and formatted questions:

```typ
#question()[
    What is the answer to this question?
]

This is the answer.
```


## Compile

First, install Typst: [Installation | Typst](https://github.com/typst/typst?tab=readme-ov-file#installation)


#### To compile the document once:

```sh
typst compile file.typ
```


#### To compile the document every time it is modified:

```sh
typst watch file.typ
```


