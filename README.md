# Uni Ulm Slide Template
A beamer latex template for slides and lectures at University of Ulm

## About
TODO

## How to Use
### Creating a Presentation
First, you need to create a new beamer presentation. For that, add ``\documentclass[aspectratio=169]{beamer}`` to your ``.tex``-file (and change the aspectratio)

### Including the Theme
The beamer theme can be used for a beamer presentation by the command ``\usetheme{uulm}``.

## Functionality of the Theme
### Title Page

To add a title frame, you can use the standard ``\maketitle`` command. It creates a title Frame with a default picture and the information that is set by the following commands:

* ``\title[<optional short title>]{<title>}``
* ``\subtitle[<optional short subtitle>]{<subtitle>}``
* ``\author[<optional short author>]{<long author>}``
* ``\date{<date>}``

The title picture can be changed with an optional parameter: ``\maketitle[<path-to-picture>]``. The picture's width will automatically be set to fill the frame. To move the picture up or down you can pass an additional optional parameter to set an offset: ``\maketitle[<path-to-picture>][<offset>]``.


### Content Layout
* ``\onlyleft{<left>}``: Places the content given by the arguments on the left side of the frame.
* ``\onlyright{<right>}``: Places the content given by the arguments on the right side of the frame.
* ``\leftandright{<left>}{<right>}``: Splits the frame into two columns, which contain the content given by the two arguments.
* ``\leftmiddleandright{<left>}{<middle>}{<right>}``: Splits the frame into three columns, which contain the content given by the three arguments .

### Color Boxes
* ``\mydefinition{<title>}{<content>}``: 
* ``\myexample{<title>}{<content>}``: 
* ``\mynote{<title>}{<content>}``: 

### Other Functionalities
* **Table of contents:** At the begin of each section, a frame with a table of contents is automatically generated. Only the subsections of the current sections are shown and the other sections are displayed shaded.
* **Auto-Scaling:** Frame titles that are longer than the width of the frame are scaled down automatically.