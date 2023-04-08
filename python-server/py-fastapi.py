from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/landing")
async def read_root():
    return 'Hello world!'

if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8989)