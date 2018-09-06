# Matplotlib

### Why?
matplotlib throws error message on MacOS
Backend, install python.app

### Fix

Source relevant environment and install python.app:
```bash
conda install -c anaconda python.app
```

Get path to current python:
```bash
which python 
```

cd to directory, rename old python:
```bash
mv python pythonPREMATPLOTLIBFIX
```

Link pythonw to python:
```bash
ln -s pythonw python
```
