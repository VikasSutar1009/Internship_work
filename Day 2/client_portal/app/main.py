from fastapi import FastAPI
from sqlalchemy.orm import Session
from .database import get_db

app = FastAPI(title="Client Portal API")

@app.get("/health")
def health():
    return{"status": "API is running"}

@app.get("/clients")
def read_clients():
    return {"message": "Client API Running"}
