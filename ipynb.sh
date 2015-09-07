#!/bin/bash

ipython profile create nbserver
key=$(python -c "from IPython.lib import passwd; print(passwd())")

cd ~/.ipython/profile_nbserver/
sed -i "4 a\
c.IPKernelApp.pylab = 'inline'\\
c.NotebookApp.ip = '*'\\
c.NotebookApp.open_browser = False\\
c.NotebookApp.password = u'$key'\\
c.NotebookApp.port = 8888\\
" ipython_notebook_config.py
