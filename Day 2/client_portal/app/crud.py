from sqlalchemy.orm import Session
from . import models, schemas

def get_clients(db: Session):
    return db.query(models.Client).all()
