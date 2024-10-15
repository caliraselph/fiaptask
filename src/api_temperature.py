from logging import exception

import requests
import pandas as pd
import json

def data_temperature_now(latitude, longitude):
    try:
        vv_url = 'https://api.open-meteo.com/v1/forecast?latitude=#latitude&longitude=#longitude&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m'
        vv_url = vv_url.replace('#latitude',str(latitude)).replace('#longitude',str(longitude))
        response = requests.get(vv_url)
        if response.status_code == 200:
           data_json         = response.json()

           #Get values from json
           vv_val_time           = data_json['current']['time']
           vv_val_interval       = data_json['current']['interval']
           vv_val_temperature_2m = data_json['current']['temperature_2m']
           vv_val_wind_speed_10m = data_json['current']['wind_speed_10m']

           #Get units name from json
           vv_unit_time           = data_json['current_units']['time']
           vv_unit_interval       = data_json['current_units']['interval']
           vv_unit_temperature_2m = data_json['current_units']['temperature_2m']
           vv_unit_wind_speed_10m = data_json['current_units']['wind_speed_10m']

           print(vv_val_time ,vv_unit_time)

    except Exception as e:
        print('Error: ', e)


def data_temperature_future(latitude, longitude):
    try:
        vv_url = 'https://api.open-meteo.com/v1/forecast?latitude=#latitude&longitude=#longitude&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m'
        vv_url = vv_url.replace('#latitude',str(latitude)).replace('#longitude',str(longitude))
        response = requests.get(vv_url)
        if response.status_code == 200:
            data_json = response.json()
            df = pd.DataFrame(data_json["hourly"])
            df["time"] = pd.to_datetime(df["time"])
            df = df.rename(columns={'time': 'Dia-Hora', 'temperature_2m': 'Temperature(°C)','relative_humidity_2m': 'Umidade(%)','wind_speed_10m':'Veloc. do Vento(km/h)'})
            print(df)

    except Exception as e:
        print('Error: ', e)




