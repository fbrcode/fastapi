from fastapi.testclient import TestClient

from api.app import app

client = TestClient(app)


def test_read_home():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"path": "root", "message": "Hello World New"}
