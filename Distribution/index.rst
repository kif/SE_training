
.. raw:: html

   <!-- Patch landslide slides background color --!>
   <style type="text/css">
   div.slide {
       background: #fff;
   }
   </style>

Distribute Python software
==========================

Outline
-------

#. setup.py and setuptools
#. Management of dependencies
#. Packages: wheels & deb
#. Fat binaries

References:

* https://python-packaging-user-guide.readthedocs.org/en/latest/
* https://docs.python.org/3.5/distutils/index.html

---------------

setup.py
--------

The setup.py is the core of the python distribution:

.. figure:: setup.svg
   :align: center
   :width: 500

This setup.py is basically a call to the setup function provided by distutils or
setuptools (the later being preferred)

The next slides will present you an incremental way to make from scratch the
*setup.py* for your project.

For now, just import the setup function for setuptools or distutils:

.. code-block:: python
   try:
       from setuptools import setup
   except ImportError:
       from distutils.core import setup

   setup(name='silx',
         version='0.0.1',
         )

https://docs.python.org/3.5/distutils/apiref.html

---------------

Start with the begining: Registration
-------------------------------------

PyPI
....

Central registration point: http://pypi.python.org

.. figure:: PyPI.png
   :align: center
   :width: 500

---------------

Actual registration:
--------------------
Add information about the author, emails and classifiers like:

.. code-block:: python

   setup(name='silx',
         version='0.0.1',
         url="https://github.com/silex-kit/silx",
         author="data analysis unit",
         author_email="silx@esrf.fr",
         classifiers = ["Development Status :: 1 - Planning",
                        "Environment :: Console",
                        "Environment :: MacOS X",
                        "Environment :: Win32 (MS Windows)",
                        "Environment :: X11 Applications :: Qt",
                        "Intended Audience :: Education",
                        "Intended Audience :: Science/Research",
                        "License :: OSI Approved :: MIT License",
                        "Natural Language :: English",
                        "Operating System :: Microsoft :: Windows",
                        "Operating System :: POSIX",
                        "Programming Language :: Cython",
                        "Programming Language :: Python",
                        "Programming Language :: Python :: Implementation :: CPython",
                        "Topic :: Documentation :: Sphinx",
                        "Topic :: Scientific/Engineering :: Physics",
                        "Topic :: Software Development :: Libraries :: Python Modules",
                        ]

         )

then:

.. code-block:: shell
    python setup.py register

All information should now be availabe online.
It is advised to separate classifiers in a dedicated list.

Available classifiers:
https://pypi.python.org/pypi?%3Aaction=list_classifiers

---------------

Define your package
-------------------

Create a directory of the name of your module and a __init__.py file in it.
Modify your setup.py accordingly.

.. code-block:: python
   setup(name='silx',
         version='0.0.1',
         url="https://github.com/silex-kit/silx",
         author="data analysis unit",
         author_email="silx@esrf.fr",
         classifiers = classifiers,
         description="Software library for X-Ray data analysis",
         packages=["silx", "silx.io", "silx.third_party", "silx.visu"],
         )

In this example the *io*, *third_party* and *visu* sub-packages have also been
declared.

You can now build your module with:

.. code-block:: shell
    python setup.py build

From now on, you should be able to:
* create a source package with *python setup.py sdist*
* install your package with *python setup.py install*
* create a binary package with *python setup.py bdist*

Binary packages can be *exe* and *msi* under Windows, *zip* under MacOSX,
*tar.gz* or *rpm* under linux, ...

---------------

Dependencies
------------

Dependency management is available at 3 different levels:
* from setuptools
* from PIP requirement file
* from Debian packages

Dependencies allow the user to know what other library is required.
Those requirement can be build requirement or use requirement:
*install_requires* and *setup_requires*

.. code-block:: python
   install_requires = ["numpy", "h5py"]
   setup_requires = ["numpy", "cython"]

   setup(name='silx',
         version=get_version(),
         url="https://github.com/silex-kit/silx",
         author="data analysis unit",
         author_email="silx@esrf.fr",
         classifiers = classifiers,
         description="Software library for X-Ray data analysis",
         long_description=get_readme(),
         packages=["silx", "silx.io", "silx.third_party", "silx.visu"],
         install_requires=install_requires,
         setup_requires=setup_requires,
         )


---------------


*setup.py* dependency vs *requirement.txt*
..........................................

Info: https://caremad.io/2013/07/setup-vs-requirement/

* *setup.py* provides an abstract dependency (i.e. h5py)
* *requirenement.txt* provides concrete implementation (often with hard coded versions and URL to download wheels from).
  This is often organization specific or CI-tool specific: h5py==2.5.0

---------------

Building packages
-----------------
Packages are the best way to distribute a library, regardless to the operating system.
For (graphical) application Fat-binaries may be a better choice, especially under Windows and MacOSX and will be discussed in next chapter

There are 2 kind of packages to be distinguished:

* Operating system packages: RPM, DEB, ...
* Python specific packages: Wheels (obsoletes eggs)

Advantages of packaging tools:

* keeps track of installed packages
* management of dependencies
* provides access to a package repository.

---------------


Wheels (PEP427)
---------------

Wheels are the new standard of python distribution and have replaced eggs.
http://pythonwheels.com/

Advantages of wheels

#. Faster installation for pure python and native C extension packages.
#. Avoids arbitrary code execution for installation. (Avoids setup.py)
#. Installation of a C extension does not require a compiler on Windows or OS X.
#. Allows better caching for testing and continuous integration.
#. Creates .pyc files as part of installation to ensure they match the python interpreter used.
#. More consistent installs across platforms and machines.

They provide binary packages and a decent installer (pip) for Windows and MacOSX.

---------------

Building Wheels
---------------

You will need setuptools and wheel:

.. code-block:: shell

  apt-get install setuptools wheel

or:

.. code-block:: shell

  pip install setuptools wheel --user

then:

.. code-block:: shell

  python setup.py bdist_wheel

Pitfalls:
---------
External shared library (Qt, hdf5, ...)
You can use the delocate utility to check which libraries you are linking against.
For example, this is the result of running delocate-listdeps --all on a binary
wheel for the pyqt library:

---------------

Debian packages
---------------

To build debian packages we recommend an additionnal tool: *stdeb*
.. code-block:: shell
   sudo apt-get install python-stdeb python3-stdeb
   python setup.py --command-packages=stdeb.command bdist_deb

You should find your python-*package**.deb in deb_dist directory.

stdeb can be configured with an additionnal file: *stdeb.cfg*


------

.. include:: fat_binaries.rst
