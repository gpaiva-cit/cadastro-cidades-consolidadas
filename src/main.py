import numpy as np
import pandas as pd

from infra.my_sql import MySQL
from utils.column_names import column_names
from utils.data_dictionary import data_dictionary
from repository import centauro, cidade, economia, populacao

my_sql = MySQL()

print('Importando dados do CSV...')

file = pd.read_csv('dados.csv', 
    dtype = data_dictionary, 
    na_values = ['-']
).replace(
    [np.nan], 
    [None]
).rename(
    column_names, 
    axis = 'columns'
)

header = list(file.columns)

print('Cadastrando dados no banco...')

for city in file.values:
    if city[0] != None:
        dict_city = dict(
            zip(header, [str(value) if value != None else value for value in city])
        )

        my_sql.cursor.execute(cidade.insert, dict_city)
        my_sql.cursor.execute(populacao.insert, dict_city)
        my_sql.cursor.execute(economia.insert, dict_city)
        my_sql.cursor.execute(centauro.insert, dict_city) 
        
my_sql.con.commit()
my_sql.close()

print('Finalizado!')
