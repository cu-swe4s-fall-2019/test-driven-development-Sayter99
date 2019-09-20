import sys


def read_stdin_col(col_num):
    L = []
    for line in sys.stdin:
        cols = line.splitlines()[0].split(' ')
        # check if the col_num is valid or not
        if (len(cols) < col_num or col_num == 0):
            print('invalid column number')
            return []
        element = cols[col_num - 1]
        # test the content
        try:
            float(element)
        except ValueError:
            continue
        L.append(element)
    return L
