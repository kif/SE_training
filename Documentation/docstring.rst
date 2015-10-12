
Docstrings
----------

\ 

------

Introduction
............

Python strings documenting modules, functions, classes and methods

Docstring conventions `PEP 257 <https://www.python.org/dev/peps/pep-0257/>`_:

- Specify where: String as the first statement.
- Convention: Use triple quotes ``"""``.

.. code-block:: python

   # rand.py
   """This module provides a random generator."""  # Module docstring

   import random

   def rand():
       """Returns a random floating point number."""  # Function docstring
       return random.random()

------

Purpose
.......

- Document the source code.

- Online help in Python console:

.. code-block:: python

  >>> import rand
  >>> help(rand.rand)  # Display function profile and the docstring

::

  Help on function rand in module rand:

  rand()
      Returns a random floating point number.

.. code-block:: python

  >>> rand.rand.__doc__  # Access to docstring
  "Returns a random floating point number."

- Used by external tools to generate the documentation.

------

The different docstrings
........................

One-line:

.. code-block:: python

   """A single line docstring."""

Multi-lines:

.. code-block:: python

   """A line of summary.

   A more detailed description.
   """

------

Docstrings for module and function
..................................

.. code-block:: python

   # rand.py

   import random

   # Module docstring alternative declaration
   __doc__ = """This module provides a random generator."""

   def rand():
       """Returns a random floating point.
       
       The returned value is in the range [0., 1.).
       """  # Function docstring
       return random.random()

------

Docstrings for class and method
...............................

.. code-block:: python

   import random

   class RandomGenerator(object):
       """Pseudo random generator class."""  # Class docstring

       def __init__(self):
           """Initialize the random generator."""  # Method docstring

           pass

       def rand(self):
           """Returns a pseudo-random float."""  # Method docstring

           return random.random()


------

Attribute docstrings
....................

.. code-block:: python

   # rand.py
   RAND_SEED = 1
   """Seed used by rand."""  # Module attribute docstring

   class RandomGenerator(object):

       DEFAULT_SEED = 1
       """Default random generator seed."""  # Class attribute docstring

       def __init__(self, seed=None):
           
           self.seed = seed or self.DEFAULT_SEED
           """The generator's seed."""  # Instance attribute docstring


- Instance attribute docstring only in ``__init__`` method.
- Not available in console help (No ``__doc__`` attribute).
- But used by tools to generate the offline documentation.

------

Docstrings content
..................

`PEP 257 <https://www.python.org/dev/peps/pep-0257/>`_ docstring content recommendation:

- For **script**: Module docstring should describe how to use the script from the command line.
- For **module**: List of the classes, exceptions and functions with a one-line summary of each.
- For **class**: Behavior summary, list of the public method and instance variables.
- For **function** and **method**: Behavior summary, documentation of arguments, return values, side effects, exceptions raised, restrictions.

------

Sum-up
......

- Docstring: A string as the first statement.
- Documentation available from the interpreter: ``help``.
- Usable by external tool to generate the documentation.
