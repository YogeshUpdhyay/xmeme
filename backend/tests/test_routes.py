from fastapi.testclient import TestClient
from api import app
import json

client = TestClient(app)

api_prefix = "/memes"

def test_post_memes():
    for i in range(10000):
        data = {
            "name": "User{}".format(str(i)),
            "caption": "Caption",
            "url": "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
        }
        response = client.post(api_prefix, data=json.dumps(data))
    assert response.status_code == 200