from app.api.v1 import hello
from fastapi import APIRouter

api_router = APIRouter()
api_router.include_router(hello.router, prefix="/hello", tags=["hello"])
