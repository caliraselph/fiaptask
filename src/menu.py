import src.dao.connect_oracle as conn
#
import os
#
# from src.dao.agro_tp_cultivo import data_select
from src.dao.agro_tp_cultivo import data_select
from src.api_temperature import data_temperature_now
from src.api_temperature import data_temperature_future
from src.dao.agro_cultivo import read_crop

while conn.vb_connect:
  os.system('cls')

  print("---- CONSULTA E PROJEÇÃO DE DADOS PARA RESOLUÇÃO DE PROBLEMAS EM CULTIVOS----")
  print("""
  1 - Listar Tipos de Solo (Oracle db)
  2 - Mostrar Temperatura Atual (api-json)
  3 - Listar Temperatura do Dia (api-json)
  4 - Leitura de cultivos (arquivo txt)
  6 - SAIR
  """)
  # Captura a escolha do usuário
  vn_option = int(input( ' ' + "Escolha -> "))

  match vn_option:
   case 1:
    data_select()
   case 2:
    data_temperature_now(-27.09,-52.61)
   case 3:
    data_temperature_future(-27.09, -52.61)
   case 4:
    read_crop()
   case 6:
    break


