from fastapi import FastAPI, Response
import uvicorn
import requests
import boto3
import os
from dotenv import load_dotenv

load_dotenv() 
app = FastAPI()

session = boto3.Session(
    region_name=os.environ.get('AWS_REGION'),
    aws_access_key_id=os.environ.get('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key=os.environ.get('AWS_SECRET_ACCESS_KEY')
)

dynamodb = session.resource('dynamodb')
table = dynamodb.Table(os.environ.get('DYNAMODB_TABLE_NAME'))


client_id = os.environ.get('SPOTIFY_CLIENT_ID')
client_secret = os.environ.get('SPOTIFY_CLIENT_SECRET')


token_url = "https://accounts.spotify.com/api/token"
auth_response = requests.post(token_url, {
    "grant_type": "client_credentials",
    "client_id": client_id,
    "client_secret": client_secret,
})
auth_response_data = auth_response.json()
access_token = auth_response_data['access_token']

@app.get("/{song_name}/{artist_name}")
async def get_album_cover(song_name: str, artist_name: str, response: Response):

    db_response = table.get_item(
        Key={
            'Song': str(song_name),
            'Artist': str(artist_name)
        }
     )
    if 'Item' in db_response:
        album_cover_url = db_response['Item']['AlbumCover']
        print(f"Fetched Album Cover for {song_name} by {artist_name} from DynamoDB")

    else:
        headers = {"Authorization": f"Bearer {access_token}"}
        search_url = "https://api.spotify.com/v1/search"
        search_params = {
        "q": f"track:{song_name} artist:{artist_name}",
        "type": "track",
        "limit": 1,
        }
        search_response = requests.get(search_url, headers=headers, params=search_params)
        search_response_data = search_response.json()
        print(f"Fetched Album Cover for {song_name} by {artist_name} from API and stored in DynamoDB")

        if not search_response_data["tracks"]["items"]:
            return {"error": "Could not find track"}

        track_id = search_response_data["tracks"]["items"][0]["id"]
        track_info_url = f"https://api.spotify.com/v1/tracks/{track_id}"
        track_info_response = requests.get(track_info_url, headers=headers)

        album_cover_url = track_info_response.json()["album"]["images"][0]["url"]
      
        table.put_item(
          Item={
               'Song': str(song_name),
               'Artist': str(artist_name),
               'AlbumCover': str(album_cover_url),
           }
          )
     
    image_response = requests.get(album_cover_url)
    response.headers["content-type"] = image_response.headers["content-type"]
    return Response(content=image_response.content)
    
if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8989)
