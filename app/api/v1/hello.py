"""This is a generated example file that is supposed to be modified."""

from typing import Any

from fastapi import APIRouter

router = APIRouter()


@router.get("")
def hello_world() -> Any:
    """Retrieve all products."""
    return {"message": "Hello World!"}
