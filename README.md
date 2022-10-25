# Uni Ulm Slide Template

## About
This is a beamer latex template for slides and lectures at University of Ulm.

## How to Use
### Creating a Presentation
First, you need to create a new beamer presentation. For that, add ``\documentclass[aspectratio=169]{beamer}`` to your ``.tex``-file (and change the aspectratio)

### Including the Theme
The beamer theme can be used for a beamer presentation by the command ``\usetheme{uulm}``.

### Creating a Symbolic Link
To use the template from another directory, you can create a symbolic link to the directory of the cloned template. The terminal-commands to create such links vary between different operating systems:
- **Windows:** `mklink /J \path\to\slides\template path\to\template`
- **Linux/macOS:** `ln -s /path/to/slides/template /path/to/template`

## Functionality of the Theme
### Title Page

To add a title frame, you can use the standard ``\maketitle`` command. It creates a title Frame with a default picture and the information that is set by the following commands:

* ``\title[<optional short title>]{<title>}``
* ``\subtitle[<optional short subtitle>]{<subtitle>}``
* ``\author[<optional short author>]{<long author>}``
* ``\date{<date>}``

The title picture can be changed with an optional parameter: ``\maketitle[<path-to-picture>]``. The picture's width will automatically be set to fill the frame. To move the picture up or down you can pass an additional optional parameter to set an offset: ``\maketitle[<path-to-picture>][<offset>]``.

If no picture is given (`\maketitle`), a default picture is used. To create a title frame without a picture, you can use `\maketitle[]`.

### Section Frames

At the begin of each section a title slide is automatically generated. If you are in handout-mode, this slide also includes an overview of all sections and subsections that can be used to navigate through the slides easily.

You can overwrite this behaviour by using one of the following documentclass-options:
* `\nosectionframes`: no automatic frames at the begin of each section
* `\sectiontitleslides`: automatic title frames at the begin of each section
* `\sectionoverviews`: automatic section overviews at the begin of each section

### Faculty Colors

The color-scheme of the template can be adapted to each faculty of Ulm University with the command `\setfaculty{<faculty>}`. It can take the following values:

* `infIngPsy`: "Informatik, Ingenieurwissenschaften, Psychologie"
* `med`: "Medizin"
* `math`: "Mathematik"
* `nat`: "Naturwissenschaften"

### Setting the Logos

The title slide contains a university (bottom right) and an institute (bottom left) logo. By default, the university logo is the logo of Ulm University and the institute logo is empty.

Your can set the logos yourself using the commands `\universitylogo{<image-file>}` and `\institutelogo{<image-file>}`. The commands `\clearuniversitylogo` and `\clearinstitutelogo` can be used to remove the logos.

You can also freely configure as many logos as you want using the command `\uulmlogos{<list-of-logos>}` (with the logos separated by commas).

### Slide Layout

You can use the the `mycolumns` environment to layout your slides (it is safe to use with verbatim, but still requires the beamer `fragile`-option for the frame ).
Within, the `\mynextcolumn` can be used to separate columns, various options allow you to customize the appearance:

```latex
\begin{mycolumns}[columns=3, t]
   Content of Column 1
\mynextcolumn
		Content of Column 2
\mynextcolumn
		Content of Column 3
\end{mycolumns}
```

In total, there are the following options:
| Option | Default | Description |
|:-------|:--------|:------------|
|`c`     | yes | Will center the content of the columns vertically |
|`t`     | no  | Will vertically align based on the baseline of the first line of each column |
|`b`     | no  | Will vertically align based on the baseline of the last line of each column |
|`T`     | no  | Similar to `t` but will use the very top of the first line (good for images, ...). |
| `width=<width>` | `\linewidth` | The total width of all columns (including margins) |
| `margin=<width>` | `0.035\linewidth` | The horizontal space between columns. |
| `columns=<amount>` | `2` | The number of columns |
| `widths={<widths>}` | `{}` | A comma-separated list of values, which determine how wide the columns should be. For example, using `columns=4, widths={40,30}` will cause the first column to occupy 40% of the width, the next one 30%, and evenly distribute the remaining 30% among the other two columns (equivalent to `columns=4, widths={40,30,15,15}`). |
| `animation=none` | yes | Will make all slides visible by default, without any animation (should not be combined with `reverse`). |
| `keep` or `animation=keep`| no | Similar to the "and" mode of the old layouts. This will cause the columns to be animated one after the other, with previous columns remaining visible. |
| `forget` or `animation=forget`| no | Similar to the "or" mode of the old layouts. This will cause the columns to be animated one after the other, with previous columns disappearing again. This behavior is active *only in recording mode* (`\recordingtrue`), otherwise, this is similar to `animation=keep`. |
| `reverse`| no | With the default animation order being left-to-right, this makes it right-to-left. |
| `extra/columns=<value>`| `{}` | Only for people who know, what they are doing. This allows direct, overwriting access on the beamer-`columns` mechanism working behind the scenes. |

Some of these defaults may appear arbitrary. They can be changed (locally to the current group) with the macro `\setmycolumnsdefault` (accumulative):

```latex
\setmycolumnsdefault{margin=7mm,t}
```

#### Old Macros

Please note that, all of the macros in this section are deprecated (for not being verbatim-safe). Please use the `mycolumns`-mechanism described above.

The following layouts can be used to arrange content into multiple columns on a frame. Some of them are also animated.
* ``\leftandright{<left>}{<right>}``, ``\leftmiddleandright{<left>}{<middle>}{<right>}`` <br> Splits the frame into multiple columns, which contain the content given by the multiple arguments.
* ``\leftthenright{<left>}{<right>}``, ``\leftmiddlethenright{<left>}{<middle>}{<right>}`` <br> Splits the frame into multiple columns, which contain the content given by the multiple arguments and are displayed column by column with the previous columns remaining on the slide (only if not in ``handout``-mode).
* ``\leftorright{<left>}{<right>}``, ``\leftmiddleorright{<left>}{<middle>}{<right>}`` <br> Splits the frame into multiple columns, which contain the content given by the multiple arguments and are displayed column by column individually with a blank frame in between (only if not in ``handout``-mode). <br> **Hint:** This only works if the recording mode is enabled via ``\recordingtrue``, otherwise it will act the same as ``\leftthenright`` or ``\leftmiddlethenright``.

### Color Boxes
The following colorboxes can be used for writing definitions, examples and notes. The each consist of a title and a content part.
* ``\mydefinition{<title>}{<content>}``
* ``\myexample{<title>}{<content>}``
* ``\mynote{<title>}{<content>}``

Additionally there are environments named `environment`, `example` and `note`, that can be used as verbatim-safe alternatives.

### Other Functionalities
* **Easy Navigation in Slides:** A click on the title or subtitle in the slide footer leads to a jump to the title slide. A click on the section title brings you to the begin of the section.
* **Auto-Scaling:** Frame titles that are longer than the width of the frame are scaled down automatically. This can avoid annoying linebreaks for a single character or word.
* **Recording mode:** This theme comes with a optional recording mode. In this mode, the animations for the content layouts ``\leftorright`` and ``\leftmiddleorright`` are different. Each column that is generated by those layouts is displayed individually one after another with a blank slide in between. That way, the presenter can walk over to the other side of the frame if recording in front of the slides. <br> The recording mode can be enabled using the command ``\recordingtrue``.