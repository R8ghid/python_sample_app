# Sample containerized Python application

This repo contains a sample application to deploy to Kubernetes. The application is a simple HelloWorld app using Python and Flask framework.

## Run with Python

System Requirements: [Git](http://www.git-scm.com), [Python 3.8.0](https://www.python.org/downloads/)

```bash
# Check dependencies
$ git --version
git version 2.23.0

$ python --version
Python 3.8.0

$ pip --version # pip comes as a part of python install
pip 20.0.2 from /usr/local/lib/python3.8/site-packages/pip (python 3.8)

# Clone the sourcecode
$ git clone <repo url>
$ cd <project dir>

# Install project dependencies
$ pip install -r requirements.txt

# Run the application
$ PORT=5001 python src/app.py

# Check application
$ curl http://localhost:5001/debug
# (or)
# In Browser visit -> http://localhost:5001/debug/ui
```

## Sample output

Pointing your browser to <http://localhost:5001/debug/ui> will bring up the following:

![](images/output.png)
