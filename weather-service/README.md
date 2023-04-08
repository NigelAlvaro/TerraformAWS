# This Python Application make Weather WebApp

In this project, we will create Python web applications using weather API. The script will create a Python web server that listens on port 8989 and return SanDiego's weather on specific date when the endpoint http://localhost:8989/yyyy-mm-dd is hit.

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
## Step 2: Running the Web Applications
To run the web applications using different frameworks, run the following command: </br>
FastAPI:
```bash
py weather.py
```
</br></br>
## File Contents in this folder:
