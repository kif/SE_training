
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

This setup.py is basically a call to the setup function provided by distutils or setuptools (the later being preferred)

---------------



---------------

Dependencies
------------

plop


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

You will need setuptools and wheel::

  apt-get install setuptools wheel

or::

  pip install setuptools wheel --user

then::

  python setup.py bdist_wheel

Pitfalls:
---------
External shared library (Qt, hdf5, ...)
You can use the delocate utility to check which libraries you are linking against.
For example, this is the result of running delocate-listdeps --all on a binary wheel for the tornado library:
