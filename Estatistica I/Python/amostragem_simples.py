# Import pandas (dataframe)
import pandas as pd

# import numpy (funções estatísticas)
import numpy as np

base = pd.read_csv('.\Arquivos\iris.csv')

base

base.shape

# amostra
amostra = np.random.choice(a = [0,1], size = 150, replace= True, p = [0.5, 0.5])
amostra
len(amostra)
len(amostra[amostra == 1])
len(amostra[amostra == 0])

