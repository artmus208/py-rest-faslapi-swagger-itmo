from sqlalchemy import Column, Integer, String
from app.db.setup_db import Base, meta


class Term(Base):
    __tablename__ = "terms"
    # __table_args__ = {'schema': meta}  # Указываем метаданные для этой таблицы

    id = Column(Integer, primary_key=True, index=True)
    keyword = Column(String, unique=True, index=True)
    description = Column(String)