# A Godot Tutorial

This tutorial shows how to make 3D games in Godot.

- using sphinx
- using GitHub Pages
- exporting the games to HTML5
- integrates the games in the site

# Installing Sphinx

- go to [https://www.sphinx-doc.org/en/master/]

- install a virtual environment .venv
- open the terminal
- install sphinx with `pip3 install -U sphinx`
- check the version

```
(.venv) % sphinx-build --version
sphinx-build 4.2.0
```

## Quickstart

We will place all the files into the `docs` folder.

- run `sphinx-quickstart docs`

This creates:
- conf.py
- index.rst
- make.bat
- MakeFile

## Build

- build with `sphinx-build -M html docs docs`


## Install Furo

- https://pradyunsg.me/furo/
- install with `pip install furo`

## installed modules

```
% pip list                                                                                                 main
Package                       Version
----------------------------- ----------
accessible-pygments           0.0.5
alabaster                     1.0.0
babel                         2.18.0
beautifulsoup4                4.14.3
certifi                       2026.2.25
charset-normalizer            3.4.6
docutils                      0.22.4
furo                          2025.12.19
idna                          3.11
imagesize                     2.0.0
Jinja2                        3.1.6
MarkupSafe                    3.0.3
packaging                     26.0
pip                           26.0.1
Pygments                      2.20.0
requests                      2.33.0
roman-numerals                4.1.0
snowballstemmer               3.0.1
soupsieve                     2.8.3
Sphinx                        9.1.0
sphinx-basic-ng               1.0.0b2
sphinxcontrib-applehelp       2.0.0
sphinxcontrib-devhelp         2.0.0
sphinxcontrib-htmlhelp        2.1.0
sphinxcontrib-jsmath          1.0.1
sphinxcontrib-qthelp          2.0.0
sphinxcontrib-serializinghtml 2.0.0
typing_extensions             4.15.0
urllib3                       2.6.3
```


