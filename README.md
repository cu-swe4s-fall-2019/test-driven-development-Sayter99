# test-driven-dev
Test Driven Development

This is the assignment for practicing *Test Driven Development*.

## Continuous Integration Status
![](https://travis-ci.com/cu-swe4s-fall-2019/test-driven-development-Sayter99.svg?branch=master)

## Installation
To use this package, you need to have [Python3](https://www.python.org/download/releases/3.0/) in your environment. And the used packages are listed below.

### Used Packages
* argparse
* os
* sys
* math
* pycodestyle
* unittest
* matplotlib

## Usage
`viz.py` is the main program for generating *histogram/boxplot/combo* from `STDIN`.
Examples of using `viz.py`:
* `bash gen_data.sh | python viz.py --col_num 1 --out_file hist.png --plot_type histogram`
* `bash gen_data.sh | python viz.py --col_num 2 --out_file box.png --plot_type boxplot`
* `bash gen_data.sh | python viz.py --col_num 1 --out_file combo.png --plot_type combo`

## Changes in this assignment
* Add both functional tests (`test_viz.sh`) and unit tests (`test_viz.py`)
* Complete robust modules and scripts including `math_lib`, `get_data`, `data_viz`, and `viz.py`
    * complete `list_mean` and `list_stdev` functions
    * complete `read_stdin_col` for generating an array from `STDIN`
    * implement plot generator by `matplotlib`
    * create `viz.py` script to parse arguments and generate plots
* Test and development iteratively
* Modify travis.yaml to carry out added tests
