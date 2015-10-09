
Fat binaries
------------

Standalone self-contained applications or installers.

- Include Python interpreter and all dependencies.
- Fits Windows and Mac OS X application distribution, as unlike Linux they lack a dependency management tools.

Beware:

- Fat binaries are fat.
- You are redistributing (many) other people work, so take care about licences.

------

Freezing
........

There is a number of tools to 'freeze' a Python application for distribution from an installation on a computer.

Principle:

- Analyze a script to find its dependencies (i.e., its imports).
- Collect all dependencies and python interpreter in a directory.
- Add a launcher and eventually bundle every thing in a single file or installer.

Issues:

- Analysis can miss some hidden imports.
- All runtime dependencies must be included (including external libraries wrapped by Python packages).


------

Tools
.....

- `PyInstaller <http://www.pyinstaller.org/>`_: Cross-platform
- `cx_Freeze <http://cx-freeze.readthedocs.org/>`_: Cross-platform
- `py2app <https://pythonhosted.org/py2app/>`_: Mac OS X

\ 

- `pex <https://github.com/pantsbuild/pex>`_: Linux, Mac OS X
- `py2exe <https://pypi.python.org/pypi/py2exe/>`_: Windows
- `bbFreeze <https://pypi.python.org/pypi/bbfreeze>`_: Windows, Linux

------

PyInstaller
...........

`PyInstaller <http://www.pyinstaller.org/>`_ is a command line tool to freeze Python scripts into executables.

Its goal is to integrate specific stuff for 3rd-party packages (e.g., PyQt, matplotlib) and Windows Runtime.

------

PyInstaller QuickStart
......................

How-to make an application from a script:

- Install the Python of your choice and the script dependencies.
- Install PyInstaller: ``pip install PyInstaller``
- Run: ``pyinstaller <script>.py``
- It performs the analysis of the script, and creates a ``dist/<script>`` directory with all the required files to run the script.

PyInstaller options:

- ``--onefile`` to make a single .exe file instead of a directory.
- ``--windowed`` to hide the console for GUI scripts.

------

PyInstaller
...........

On Windows:

- ``<script>.exe`` is in ``dist/<script>``
- Then use a tool such as `NSIS <http://nsis.sourceforge.net/>`_ to create an installer from this directory.

On Mac OS X:

- Always create a command line executable.
- With ``--windowed`` create a Mac Application (i.e., ``.app``).

------

PyInstaller
...........

Limitations:

- It might include useless packages.
- It might miss some dependencies, some external file resources...

It uses a ``*.spec`` to configure the build, which can be tuned.
See `doc <http://pythonhosted.org/PyInstaller/>`_.

------

cx_Freeze
.........

Write a ``cx_setup.py``.


------

cx_Freeze
.........

First install your package and its dependencies

On Windows, run ``python cx_setup.py build_exe`` to build a directory with all required files.
Then create an installer with NSIS.

On Mac OS X, run ``python cx_setup.py bdist_dmg`` to build a .dmg with an .app included.
