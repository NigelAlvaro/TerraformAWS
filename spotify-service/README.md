# This Python Application make Spotify WebApp

In this project, we will create Python web applications using Spotify API. The script will create a Python web server that listens on port 8989 and return the Album Cover from specific songs when the endpoint http://localhost:8989/song-name/artist-name is hit. A dynamoDB will be use for cache and can be run by going to the folder "spotify-data"

## Step 1: Installing Dependencies

Before running any of the scripts, you need to install the following dependencies:

- Python 3.x
- pip

You can check if you have pip installed by running:

```bash
pip --version
```
If not, run the following command to install pip:
```bash
py -m ensurepip --upgrade
```
You can check if you have the other necessary dependencies installed by running:
```bash
pip list
```
If any of the required dependencies are missing, run the following commands to install them:
```bash
pip install fastapi
pip install uvicorn
```
## Step 2: Fill in your Credentials
Open the file spotify.py, and fill in the followings: </br>
<strong>
- AWS_REGION
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- DYNAMODB_TABLE_NAME
- SPOTIFY_CLIENT_ID
- SPOTIFY_CLIENT_SECRET 
</strong>

## Step 3: Running the Web Applications
To run the web applications using different frameworks, run the following command: </br>
FastAPI:
```bash
py spotify.py
```

