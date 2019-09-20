import matplotlib
import matplotlib.pyplot as plt
import math_lib
matplotlib.use('Agg')


def boxplot(L, out_file_name):
    plt.boxplot(L)
    plt.ylabel('Frequency')
    plt.xlabel('Value')
    plt.title('mean: ' + str(math_lib.list_mean(L)) +
              'stdev: ' + str(math_lib.list_stdev(L)))
    plt.savefig(out_file_name)
    pass

def histogram(L, out_file_name):
    plt.hist(L, bins=len(L)/10)
    plt.ylabel('Frequency')
    plt.xlabel('Value')
    plt.title('mean: ' + str(math_lib.list_mean(L)) +
              'stdev: ' + str(math_lib.list_stdev(L)))
    plt.savefig(out_file_name)
    pass

def combo(L, out_file_name):
    fig, axs = plt.subplots(1, 2, sharey=True, tight_layout=True)
    axs[0].hist(L, bins=len(L)/10)
    axs[1].boxplot(L)
    fig.savefig(out_file_name)
    pass
