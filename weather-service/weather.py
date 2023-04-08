from fastapi import FastAPI
import uvicorn
import requests
import datetime

app = FastAPI()

api_key = 'd8372fd7ad9a9a816726364ebeb41b63'

@app.get("/weather/{date}")
async def get_weather(date: str):
     date_with_time = datetime.datetime.strptime(date, '%Y-%m-%d')
     date_with_time = date_with_time.replace(hour=0, minute=0, second=0)
     response = requests.get(f'https://api.openweathermap.org/data/2.5/weather?q=San Diego&appid={api_key}&dt={int(date_with_time.timestamp())}')
     today_weather = response.json()['weather'][0]['description']
     location = response.json()['name']
     date = datetime.datetime.fromtimestamp(response.json()['dt']).strftime('%Y-%m-%d %H:%M:%S')
     return {"location": location, "date": date, "weather": today_weather}

if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8989)
