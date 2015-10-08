
Fat binaries
------------

Standalone self-contained applications or installers.

- Include Python interpreter and all dependencies.
- Fits Windows and Mac OS X application distribution, as unlike Linux they do not provide dependency management tools.

There are a number of tools to 'freeze' an application for distribution.

Pitfalls:
All runtime dependencies must be included (including external libraries wrapped by Python packages).

Incomplete docs:
`Freezing your code <http://docs.python-guide.org/en/latest/shipping/freezing/>`_,
`Application Deployment <https://python-packaging-user-guide.readthedocs.org/en/latest/deployment/>`_.

------

Tools: Cross-platform
.....................

`cx_Freeze <http://cx-freeze.readthedocs.org/>`_:

Freeze Python scripts into executables.
``distutils`` commands to create a folder for the program and can build simple installer.

`PyInstaller <http://www.pyinstaller.org/>`_:

Freeze Python scripts into executables.
Goal is to integrate specific stuff for 3rd-party packages (e.g., PyQt, matplotlib) and Windows Runtime.
Build a directory with an executable and the required files or a single exe file.

`bbFreeze <https://pypi.python.org/pypi/bbfreeze>`_:

Freeze Python scripts into executables.
Not for Mac OS X.

`pex <https://github.com/pantsbuild/pex>`_: Python EXecutable format

Build an isolated Python environment (like ``virtualenv``) in a zip file.
Not for Windows.

------

Tools: Windows only
...................

`py2exe <https://pypi.python.org/pypi/py2exe/>`_:

``distutils`` command that stores (hopefully) all files required to run a script in a directory.

`Pynsist <https://pypi.python.org/pypi/pynsist>`_:

Build a Windows installer (can be done from Linux).

Installation process:

#. Install Python on the system (not along with the application).
#. Install the application (launcher scripts, icon, Python package and resources).
#. Create shortcuts to launcher scripts
#. Create an uninstaller (That will not uninstall Python).

------

Tools: Mac OS X only
....................

`py2app <https://pythonhosted.org/py2app/>`_

``setuptools`` command to make standalone application bundles from Python scripts.
