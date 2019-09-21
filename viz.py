import sys
import os
import argparse
import data_viz
import get_data


# parse arguments (file_name, column_number)
def parse_args():
    parser = argparse.ArgumentParser(
                description='The right way to pass parameters.',
                prog='viz.py')

    # require file name as one of the inputs
    parser.add_argument('--out_file',
                        type=str,
                        help='Name of the output file',
                        required=True)

    # require plot type as one of the inputs
    parser.add_argument('--plot_type',
                        type=str,
                        help='The plot type [histogram/boxplot/combo]',
                        required=True)

    # require plot type as one of the inputs
    parser.add_argument('--col_num',
                        type=int,
                        help='The column number',
                        required=True)

    return parser.parse_args()


def main():
    # get argument by arg parser
    args = parse_args()
    # check if it is a valid file name
    if not os.access(args.out_file, os.W_OK):
        try:
            open(args.out_file, 'w').close()
            os.unlink(args.out_file)
        except OSError:
            print('Invalid file name')
            sys.exit(1)
    # get an array from STDIN
    L = get_data.read_stdin_col(args.col_num)
    if len(L) == 0:
        print('Empty list')
        sys.exit(1)
    # choose plot type
    if (args.plot_type == 'histogram'):
        data_viz.histogram(L, args.out_file)
    elif (args.plot_type == 'boxplot'):
        data_viz.boxplot(L, args.out_file)
    elif (args.plot_type == 'combo'):
        data_viz.combo(L, args.out_file)
    else:
        print('Invalid plot type')
        sys.exit(1)
    sys.exit(0)


if __name__ == '__main__':
    main()
