from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/")
def home():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int):
    return {"item_id": item_id}


def start():
    """Launched with `poetry run api` at root level"""
    uvicorn.run("api.app:app", host="0.0.0.0", port=8000, reload=True)
