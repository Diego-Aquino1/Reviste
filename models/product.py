from typing import Optional
from sqlmodel import Field, SQLModel

class BaseProduct(SQLModel):
    code: Optional[str]
    name: str = Field(default=None, index=True)
    description: Optional[str] = Field(default=None, index=True)
    expiration_date: Optional[str] = Field(default=None, index=True)
    image: Optional[str] = Field(default="Unidad", index=True)
    weight: Optional[int] = Field(default=None, index=True)
    measurement_unit: Optional[str] = Field(default=None, index=True)
    trademark: Optional[str] = Field(default=None, index=True)
    observation: Optional[str] = Field(default=None, index=True)
    warehouse_type: Optional[str] = Field(default='G', index=True)
    category_fk: int = Field(default=None, foreign_key="pro_category.id")

class Product(BaseProduct, table=True):
    __tablename__ = "pro_product"
    code: str = Field(default=None, primary_key=True)
    register_date: Optional[str] = Field(default=None, index=True)
    state: Optional[str] = Field(default='A', index=True)