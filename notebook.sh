#!/usr/bin/env bash

jupyter notebook --generate-config
key=$(python -c "from notebook.auth import passwd; print(passwd())")

cd ~/.jupyter
sed -i "1 a\
c = get_config()\\
c.NotebookApp.ip = '*'\\
c.NotebookApp.open_browser = False\\
c.NotebookApp.password = u'$key'\\
c.NotebookApp.port = 8888" jupyter_notebook_config.py
