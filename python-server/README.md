# Three Python Application using Three different frameworks

In this project, we will create three Python web applications using different frameworks. All three scripts will create a Python web server that listens on port 8989 and returns a "Hello World!" string when the endpoint http://localhost:8989/landing is hit.

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
pip install flask
pip install fastapi
pip install uvicorn
```
## Step 2: Running the Web Applications
To run the web applications using different frameworks, run the following commands in separate terminal windows: </br>
HTTP:
```bash
py py-http.py
```
Flask:
```bash
py py-flask.py
```
FastAPI:
```bash
py pt-fastapi.py
```
</br></br>
## File Contents in this folder:

**py-flask.py**: Flask web application. </br>
**py-fastapi.py**: FastAPI web application.</br>
**py-http.py**: HTTP web application.</br>
**README.md**: This README file.</br>