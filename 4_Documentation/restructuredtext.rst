
.. role:: rst(code)
   :language: rst

reStructuredText
----------------

\ 

------

Introduction
............

ReStructuredText (`rst <http://docutils.sourceforge.net/rst.html>`_):

- "Easy-to-read" text markup syntax.
- Conversion to different formats (e.g., html, pdf).
- Version Control System friendly: Text files with one sentence per line.
- Primarily for Python documentation.

Source:

.. code-block:: rst

  Introduction
  ............

  ReStructuredText (`rst <http://docutils.sourceforge.net/rst.html>`_):

  - "Easy-to-read" text markup syntax.
  - Conversion to different formats (e.g., html, pdf).
  - ...

------


Paragraphs and sections
.......................

Paragraphs are separated by blank lines.

Sections are separated by section headers.
A section header is made of a single line of text with underline and eventually overline.

.. code-block:: rst

  =====
  Title
  =====

  Chapter
  =======

  Section
  -------

  Subsection
  ..........

There is no specified heading levels.
Section levels are determined from the succession of section headers, so it needs to be consistent.

------

Some conventions:

- Use overline and underline for titles.
- `Sphinx Python documentation convention <http://sphinx-doc.org/rest.html#sections>`_:

  - :rst:`#` with overline for parts
  - :rst:`*` with overline for chapters
  - :rst:`=` for sections
  - :rst:`-` for subsections
  - :rst:`^` for subsubsections
  - :rst:`"` for paragraphs

- Alternative order (from Tarek Ziade's book): :rst:`= - _ : # + ^`

------

Lists
.....

A bullet list:

- Items start with a caracter in ``- * +`` and a whitespace.
  Multi-line text must be aligned.
- There is a blank line before and after the list.

Syntax:

.. code-block:: rst

  A bullet list:

  - Items start with ``- * +`` and a whitespace.
    Multi-line text must be aligned.
  - There is a blank line before and after the list.

------

An numbered list with auto-enumeration:

#. First item
#. Second item

Syntax:

.. code-block:: rst

  An numbered list with auto-enumeration:

  #. First item
  #. Second item

More lists: definitions, fields, options.

------

Inline markup
.............

- *\*Emphasis\**\ : italics.
- **\*\*Strong emphasis\*\***\ : bold.
- :literal:`\`\`Literal\`\``\ : e.g., command line.

Limitations:

- No nesting.
- Whitespace around inline markup and no leading, trailing whitespaces inside.
- Escape \* \` with \\: :rst:`\*B\*` => \*B\*.

------

There is more inline markup using **roles**, syntax:

:rst:`:role_name:`content``

Example: :rst:`1\ :superscript:`st`` => 1\ :superscript:`st`

See `docutils roles <http://docutils.sourceforge.net/docs/ref/rst/roles.html>`_.

------

Links
.....

External hyperlinks:

- https://github.com/kif/SE_training
- `SE_training repository <https://github.com/kif/SE_training>`_, syntax:

  .. code-block:: rst

    `SE_training repository <https://github.com/kif/SE_training>`_

Internal hyperlinks:

.. code-block:: rst

   =========
   The title
   =========

   .. _link_target:

   Link to link_target_ (note the single :).

   Link to `The title`_.

------

Code sample
...........

Code sample can be displayed as:

A **doctest** (i.e., a copy-paste from the Python console):

>>> 1 + 1
2

.. A *literal block*::
  
    def code_sample(a, b):
        return a + b
  
  rst syntax: 
  
  .. code-block:: rst
  
    ::
  
      def code_sample(a, b):
          return a + b

A **code block** with syntax highlighting:

.. code-block:: python

   def add(a, b):
       return a + b

Syntax:

.. code-block:: rst

  .. code-block:: python

     def add(a, b):
         return a + b

This is a **directive**, syntax:

.. code-block:: rst

  .. directive_type:: arguments
     :option: value

     content

Blank lines and indentation counts.

------

Figure
......

.. figure:: rst.png
   :align: center
   :width: 300

   This is the caption.

   This is the legend.

Syntax:

.. code-block:: rst

  .. figure:: image_file
     :align: center
     :width: 300

     This is the caption.

     This is the legend.

See http://docutils.sourceforge.net/docs/ref/rst/directives.html#figure.

There is more `directives <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_.

------

Math formula
............

Using a subset of LaTeX math syntax without the ``$ $`` delimiters:

:literal:`:math:\`\\sqrt{\\frac{x^2}{3}}\`` => :math:`\sqrt{\frac{x^2}{3}}`

Syntax:

- Role (inline):
  
  .. code-block:: rst

    :math:`formula`

- Directive (paragraph):

  .. code-block:: rst

    .. math::

       formula

------

And more...
...........

This was just a primer.

- Tables, but syntax is no really convenient.
- More lists, roles and directives.
- Directive :rst:`.. raw:: language` to write html or latex.
- Extendable: Possible to add roles and directives.

------

QuickRef
........

To find more information:

- Sphinx reST Primer: http://sphinx-doc.org/rest.html
- reST QuickRef: http://docutils.sourceforge.net/docs/user/rst/quickref.html

Blank lines and indentation count.

------

Tools to convert rst
....................

- Python package `docutils tools <http://docutils.sourceforge.net/docs/user/tools.html>`_:
  ``rst2html``, ``rst2latex``, ``rst2odt``, ``rst2s5``.
- `pandoc <http://pandoc.org/>`_ a universal document converter:
  ``pandoc -s -t rst file.rst -o file.html``
- `Sphinx <http://sphinx-doc.org/>`_.

------

Sum-up
......

reStructuredText is a text markup syntax:

- Simple and readable for simple things.
- Roles and directives.
- Blank lines and indentation count.
- Conversion to different formats.

