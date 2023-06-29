import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='csv initialization')

parser.add_argument('--path', type=str, default='./result.csv',
                    help='location of the csv')

args = parser.parse_args()

df = pd.DataFrame(columns=["Model","emsize","nhid","nlayers","lr","batch_size","nhead","dropout","Test Loss","Test PPL","Train Time(h)","Number of Model Parameters(M)","Vocabulary Size","epochs"])

df.to_csv(args.path,mode="w",index=False)