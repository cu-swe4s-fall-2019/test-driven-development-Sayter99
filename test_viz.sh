#!/bin/bash

test -e ssshtest || wget https://raw.githubusercontent.com/ryanlayer/ssshtest/master/ssshtest
. ssshtest

run test_style pycodestyle data_viz.py
assert_no_stdout
run test_style pycodestyle get_data.py
assert_no_stdout
run test_style pycodestyle math_lib.py
assert_no_stdout
run test_style pycodestyle test_viz.py
assert_no_stdout
run test_style pycodestyle viz.py
assert_no_stdout

echo "...plot histogram..."
run plot_hist bash gen_data.sh | python viz.py --col_num 2 --out_file hist1.png --plot_type histogram
assert_exit_code 0
assert_stdout
if [ -f "hist1.png" ]; then
    echo "hist1.png generated successfully"
    rm hist1.png
fi

echo "...plot boxplot..."
run plot_box bash gen_data.sh | python viz.py --col_num 1 --out_file hist2.png --plot_type boxplot
assert_exit_code 0
assert_stdout
if [ -f "hist2.png" ]; then
    echo "hist2.png generated successfully"
    rm hist2.png
fi

echo "...plot combo..."
run plot_combo bash gen_data.sh | python viz.py --col_num 2 --out_file hist3.png --plot_type combo
assert_exit_code 0
assert_stdout
if [ -f "hist3.png" ]; then
    echo "hist3.png generated successfully"
    rm hist3.png
fi

echo "...missing arguments..."
run missing_args bash gen_data.sh | python viz.py --col_num 1 --out_file hist.png --plot_type
assert_exit_code 1
assert_stdout

echo "...missing arguments..."
run missing_args bash gen_data.sh | python viz.py --col_num 2 --out_file --plot_type histogram
assert_exit_code 1
assert_stdout

echo "invalid column number"
run invalid_column_number bash gen_data.sh | python viz.py --col_num 3 --out_file hist3.png --plot_type histogram
assert_exit_code 1
assert_stdout

echo "invalid column number"
run invalid_column_number bash gen_data.sh | python viz.py --col_num 0 --out_file hist3.png --plot_type histogram
assert_exit_code 1
assert_stdout

echo "...show help of viz.py..."
run missing_args bash gen_data.sh | python viz.py
assert_exit_code 1
assert_stdout
