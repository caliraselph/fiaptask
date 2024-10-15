import pandas as pd

import connect_oracle as conn

def data_select():
    data_list = []
    conn.inst_select.execute('select * from tb_agro_tp_suelo where sit = 1')
    data = conn.inst_select.fetchall()
    for dt in data:
        data_list.append(dt)

    data_list = sorted(data_list)

    data_df = pd.DataFrame.from_records(data_list,columns=['Id','Descrição'],index='Id')

    if data_df.empty:
        print(f'Não há tipos de solos cadastrados!')
    else:
        print(data_df)
    print('\nListados!')
    input('Pressione ENTER')