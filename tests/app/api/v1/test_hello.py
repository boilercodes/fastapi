"""This is a generated example file that is supposed to be modified."""

from fastapi.testclient import TestClient

from app.core import settings


def test_hello_world(client: TestClient) -> None:
    """Test the create API."""
    response = client.get(f"{settings.api.endpoint}/hello")
    assert response.json()["message"] == "Hello World!"
