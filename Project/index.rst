Structure your project
======================

Structure your code
-------------------

   - separate library from scripts
   - separate GUI from calculation
   - a word about licenses

Licenses
........

According to the French law, one should distinguish authorship from ownership:
 - Authorship is inalienable: your work becomes public domain 50 years after your death.
 - ESRF, your employer, owns the code you may have written during your contract (unless you can prove this development has no correlation with your work)

Licenses define how a piece of software can be used (and sometimes what for). None of them claim any liability of the author.
One can define 2 categories:
- Proprietary licenses
  * Commercial licenses: one needs to purchase a license to use the code
  * Academic licenses: free for academic research
- Open source licenses:
  * GPL like which allows the distribution of modified code but enforces the publication of the modification
  * MIT/BSD which provides the name of the author for information (for scientific citation)

The Python scientific stack has a BSD-like licenses.
Defining licenses for your developments is important as the beamline can not
build code on top of unlicensed or proprietary work without explicit license
agreement.

Coding convention
-----------------

Transition to Python3
.....................

By 2020, the support of Python2 will end. Supporting Python3 is a must have today.
Look at the download statistics of projects like WinPython: 3600 downloads for Python_3.4 vs 2700 for Python_2.7

https://sourceforge.net/projects/winpython/files/

Today, in 2015, one should not start a Python2 (only) project.
To ensure a smoother transition, and acquire the Python3 requested practices:

from __future__ import division, absolute_import, print_function #, unicode_literals

Coding convention: PEP8
.......................

The coding convention from Python is defined in the "Python Enhancement Proposal #8":
 - wrap lines at 79 char
 - indent with 4 spaces
 - spaces around arguments (except in function declaration)
 - Docstrings should be triple quoted and in English
 - one import per line
 - Variable, method, modules name should be lower_case (with underscore, only if needed)
 - Constant should be UPPER_CASE
 - Class names should be CamelCase
 - single letter variable should be limited to loop indexes
 - One statement per line
 - Two empty lines between top-level objects, only one later

Zen of Python: PEP20
....................

 1. Beautiful is better than ugly.
 2. Explicit is better than implicit.
 3. Simple is better than complex.
 4. Complex is better than complicated.
 5. Flat is better than nested.
 6. Sparse is better than dense.
 7. Readability counts.
 8. Special cases aren't special enough to break the rules.
 9. Although practicality beats purity.
10. Errors should never pass silently.
11. Unless explicitly silenced.
12. In the face of ambiguity, refuse the temptation to guess.
13. There should be one-- and preferably only one --obvious way to do it.
14. Although that way may not be obvious at first unless you're Dutch.
15. Now is better than never.
16. Although never is often better than *right* now.
17. If the implementation is hard to explain, it's a bad idea.
18. If the implementation is easy to explain, it may be a good idea.
20. Namespaces are one honking great idea -- let's do more of those!

Version control system
----------------------
.. image:: phd101212s.gif
   :alt: Why use a version control system

The solution to tracking versions of a bunch of files, revert back in
time to previous version, add comments to commit, ... is the work of VCS.

Git version control
...................

Git is the current (2015) standard, it has replaced RCS, CVS, SVN, Bazaar and Hg.
If you have heard any of them, the concepts in Git are similar while offering a lot of flexibility.


The usual workflow when working with Git is the following:

1. initiate a project using *init* or *clone* to copy another (remote) project .
   Any git repository contains all the history of the project, i.e all
   commit with authors, data time, file changed, and the chain of commits called *branch*
2. *add* files to the list of tracked files
3. *commit* the files, locally
4. *push* your changes to a remote repository

The cycle 2-3-4 is the normal development cycle for a local project.

To interact with a remote project, especially retrieve commits from a remote project
one uses:

5. *fetch* to retrieve the changes made on a remote repository
6. *merge* to merge changes from a remote branch into the current branch

Tutorial on Git::

    http://gitref.org   
    https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf


GitHub
......

The web service github.com provides free git-hosting for open-source project and
encourages collaboration using forks of projects.
The main advantages of GitHub are::
 - Higher visibility compared to other hosting (in 2015)
 - Offer a fixed pipeline based on *Pull request*
 - Many tutorial based on GitHub
 - Issue tracker
 - Web page hosting for projects
 - download of releases

Tutorials on GitHub::
    https://guides.github.com/

Github is actually a social network, but unlike Linked'in or Facebook it
focuses on code developers. Activities on Github are monitored by head-hunter
and can be useful for professional placement.

The alternative to github for non-public projects is GitLab::
  http://gitlab.esrf.fr

Similar to GitHub, it provides also Git-repository hosting,
