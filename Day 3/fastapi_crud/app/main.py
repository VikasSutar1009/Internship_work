from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from app.database import SessionLocal, engine, Base
from app import models, schemas

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def home():
    return{"message": "API is running"}

# READ
@app.get("/Projects/")
def get_projects(db: Session = Depends(get_db)):
    return db.query(models.Project).all()

# POST
@app.post("/Projects", response_model=schemas.ProjectResponse)
def create_project(project: schemas.ProjectCreate, db: Session = Depends(get_db)):
    new_project = models.Project(**project.dict())
    db.add(new_project)
    db.commit()
    db.refresh(new_project)
    return new_project

# PUT
@app.put("/Projects/{project_id}")
def update_project(project:schemas.ProjectUpdate, db: Session= Depends(get_db)):
    db_project= db.query(models.Project)
    if not db_project:
        return None
    
    
    db.commit()
    db.refresh(db_project)
    return db_project

# DELETE
@app.delete("/Projects/{project_id}")
def delete_project(project_id: int, db: Session=Depends(get_db)):
    db_project=db.query(models.Project).filter(
        models.Project.project_id == project_id).first()


    if not db_project:
        return {"error": "Project not found"}
    
    db.delete(db_project)
    db.commit()

    return {"message": "Project deleted "}