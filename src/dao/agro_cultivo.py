import pandas as pd
import src.dao.connect_oracle as conn
import sqlite3
import datetime

def read_crop():
    with open('E:/Temp/leitura_cultivos.txt', 'r', encoding='utf-8') as file:
        for line in file:
            cultivo_id,tp_cultivo_id,parcela_id,data_semeadura,data_colheita,rendimento = line.strip().split(',')
            data_save(cultivo_id,tp_cultivo_id,parcela_id,data_semeadura,data_colheita,rendimento)


def data_save(cultivo_id,tp_cultivo_id,parcela_id,data_semeadura,data_colheita,rendimento):
    try:


        register = f"""INSERT INTO tb_agro_cultivo (cultivo_id,tp_cultivo_id,parcela_id,
        data_semeadura,data_colheita,rendimento)VALUES ('{cultivo_id}', '{tp_cultivo_id}', '{parcela_id}',
        '{data_semeadura}', '{data_colheita}', '{rendimento}')"""
        print(register)
        conn.inst_include.execute(register)
        conn.conn.commit()

    except Exception as e:
            print('Error: ', e)

read_crop()