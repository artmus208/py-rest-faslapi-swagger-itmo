from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session

from app.db.setup_db import engine
from app.api.routes import router
from app.db.models import Base

Base.metadata.create_all(bind=engine)

app = FastAPI()
app.include_router(router, prefix="")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)