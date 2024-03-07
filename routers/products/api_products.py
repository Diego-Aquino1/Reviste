from fastapi import Request, APIRouter, HTTPException
from fastapi.encoders import jsonable_encoder
from datetime import datetime

router = APIRouter(prefix="/products")

# =============== GET -> Create products ===============
@router.get("/")
def get_products():
    return jsonable_encoder({"rpta", "Products"})