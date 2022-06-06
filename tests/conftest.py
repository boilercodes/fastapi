"""This is a generated example file that is supposed to be modified."""

from typing import Generator

import pytest
from fastapi.testclient import TestClient

from app.__main__ import app


@pytest.fixture(scope="module")
def client() -> Generator:
    """Return the test client."""
    with TestClient(app) as c:
        yield c
