
.. raw:: html

   <!-- Patch landslide slides background color --!>
   <style type="text/css">
   div.slide {
       background: #fff;
   }
   </style>

.. |br| raw:: html

   <br />

Testing
=======

#. Introduction
#. unittest
#. Continuous integration

.. TODO:
   - a word on doctest? + integration of doctest in tests
   - check: http://docs.python-guide.org/en/latest/writing/tests/
   - test data: generate input file or download not distributed !

------

What kinds of tests?
--------------------

- **Unit tests**: Test from the developer point of view.
  Test the code without the dependencies.
- **Integration tests**: Test from the developer point of view.
  Test that the code is integrated correctly with some external system or libraries.
- **Functional tests**: Test from a user point of view.
  Call a script, use the public API of a pacakge, test from the GUI.

------

When to write tests?
--------------------

- Never
- Always and before anything else: Test-Driven Development (*TDD*) [TDDwithPython]_ |br|
  Workflow:

  - First write a test, run it and check that it fails...
  - Only then write the code, and test it.
  - Then eventually do some refactoring.

*TDD* for maintenance: Reproduce bug in a test, then fix it.

Anyway, having the structure set-up for testing encourages writing tests.

.. [TDDwithPython] `Harry J.W. Percival. Test-Driven Development with Python. O'Reilly 2014. <http://chimera.labs.oreilly.com/books/1234000000754>`_
  (Oriented towards web development).

------

For who?
--------

Tests (and test coverage) are primarily for developers.

------

Where to put the tests?
-----------------------

Separate tests from the source code:

- Run the test from the command line.
- Separate test code when distributing.
- `... <https://docs.python.org/3/library/unittest.html#organizing-test-code>`_

Tests folder structure:

- In a separate ``tests/`` folder.
- In ``tests`` sub-packages in each Python package/sub-package,
  so that tests remains close to the source code.
  Tests are installed with the package and can be run from the installation.

------

::

  project/
     |---- setup.py
     |---- run_tests.py
     |---- package/
     |       |----- __init__.py
     |       |----- *.py
     |       |----- tests/
     |       |        |--- __init__.py
     |       |        |--- test_*.py
     |       |
     |       |----- subpackage/
     |                   |----- __init__.py
     |                   |----- *.py
     |                   |----- tests/
     |                            |--- __init__.py
     |                            |--- test_*.py
     |---- scripts/
     |        |---- *
     |---- tests/
             |--- test_*.py

------

.. include:: unittest.rst

------

Extra tools
-----------

Tools extending ``unittest`` to write and/or run tests:

- `QTest <http://doc.qt.io/qt-5/qtest.html>`_
- `nose <https://nose.readthedocs.org/>`_
- `pytest <http://pytest.org/>`_
- `tox <https://tox.readthedocs.org/>`_

------

QTest
.....

For GUI based on ``PyQt``, ``PySide`` it is possible to use Qt's `QTest <http://doc.qt.io/qt-5/qtest.html>`_.

It provides the basic functionnalities for GUI testing.
It allows to send keyboard and mouse events to widgets.

.. code-block:: python

  from PyQt4.QtTest import QTest
  from PyQt4 import QtCore

  ...

  widget = ...

  QTest.qWaitForWindowShown(widget)
  QTest.mouseClick(widget, QtCore.Qt.LeftButton, pos=QtCore.QPoint(1, 1))
  QTest.keyClicks(widget, 'test', delay=100)  # Wait 100ms

  ...

Tighly coupled with the code it tests.
It needs to know the widget instance and hard code the position of mouse events.

------

nose
....

`nose <https://nose.readthedocs.org/>`_ extends ``unittest``:

- Test discovery mechanism.
- Test generator (a way to support parametric tests).
- Additionnal asserts (e.g., timed test).
- Plugins:

  - Test coverage,
  - Parallel testing,
  - Profiling,
  - Output results in XUnit-xml (for Jenkins).
  - ...

------

pytest
......

`pytest <http://pytest.org/>`_ testing tools:

- Test discovery, Parameterized test, Asserts
- Distribute tests, Test coverage, Fixtures, Output JUnit XML
- Plugins
- Supports nose, unittest and docstring tests

------

tox
...

`tox <https://tox.readthedocs.org/>`_ automates testing of Python packages.

It installs a package with different versions of Python and runs the tests for each environment.
It uses `virtualenv <https://virtualenv.pypa.io/>`_ a tool to create isolated Python environment.
Integrates with Jenkins.

------

Continuous integration
----------------------

Benefits:

- Test on multiple platform/configuration (e.g., different version of Python).
- Test often: each commit, each pull request, daily...

Costs:

- Set-up and maintenance.
- Test needs to be automated.

------

In-house
--------

`Jenkins <https://jenkins-ci.org/>`_:

- 'Master' server with a web interface that controls the tests.
- 'Slave' nodes that runs the tests.

------

External
--------

- `Travis-CI <https://travis-ci.org/>`_: CI for Linux and Mac OS X
- `AppVeyor <http://www.appveyor.com/>`_: CI for Windows

Principle:

- Add a ``.yml`` file to your repository describing:

  - The test environment
  - Build and installation of the dependencies and the package
  - The way to run the tests.

- Upon commit, clones the repository and runs the tests.
- Displays the outcome on a web page.

------

Sum-up
------

- Different test strategies.
- Python ``unittest`` (and extra packages) to write and run the tests.
- Additionnal tools to efficiently run the tests: Continuous Integration.
- Next step: Continuous Deployment.
