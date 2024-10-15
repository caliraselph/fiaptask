import src.dao.connect_oracle as conn
#
import os
#
# from src.dao.agro_tp_cultivo import data_select
from src.dao.agro_tp_cultivo import data_select


while conn.vb_connect:
  os.system('cls')

  print("---- CONSULTA E PROJEÇÃO DE DADOS PARA RESOLUÇÃO DE PROBLEMAS EM CULTIVOS----")
  print("""
  1 - Listar Tipos de Solo
  2 - Mostrar Temperatura Atual
  3 - Mostrar Temperatura do Dia
  6 - SAIR
  """)
  # Captura a escolha do usuário
  vn_option = int(input( ' ' + "Escolha -> "))

  match vn_option:
   case 1:
    data_select()
   case 6:
    break


