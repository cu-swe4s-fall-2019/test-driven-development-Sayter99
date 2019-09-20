#!/bin/bash

test -e ssshtest || wget https://raw.githubusercontent.com/ryanlayer/ssshtest/master/ssshtest
. ssshtest

echo "...plot histogram..."
bash gen_data.sh | python viz.py --col_num 2 --out_file hist1.png --plot_type histogram
assert_exit_code 0
assert_stdout
if [ -f "hist1.png" ]; then
    echo "hist1.png generated successfully"
    rm hist1.png
fi

echo "...plot boxplot..."
bash gen_data.sh | python viz.py --col_num 1 --out_file hist2.png --plot_type boxplot
assert_exit_code 0
assert_stdout
if [ -f "hist2.png" ]; then
    echo "hist2.png generated successfully"
    rm hist2.png
fi

echo "...plot combo..."
bash gen_data.sh | python viz.py --col_num 2 --out_file hist3.png --plot_type combo
assert_exit_code 0
assert_stdout
if [ -f "hist3.png" ]; then
    echo "hist3.png generated successfully"
    rm hist3.png
fi

echo "...missing arguments..."
bash gen_data.sh | python viz.py --col_num 1 --out_file hist.png --plot_type
assert_exit_code 1
assert_stdout

echo "...missing arguments..."
bash gen_data.sh | python viz.py --col_num 2 --out_file --plot_type histogram
assert_exit_code 1
assert_stdout

echo "invalid column number"
bash gen_data.sh | python viz.py --col_num 3 --out_file hist3.png --plot_type histogram
assert_exit_code 1
assert_stdout

echo "invalid column number"
bash gen_data.sh | python viz.py --col_num 0 --out_file hist3.png --plot_type histogram
assert_exit_code 1
assert_stdout

echo "...show help of viz.py..."
bash gen_data.sh | python viz.py
assert_exit_code 1
assert_stdout
