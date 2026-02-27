from sqlalchemy import Column, Integer, String
from .database import Base

class Client(Base):
    __tablename__= "Clients"

    client_id= Column(Integer, primary_key=True, index=True)
    name= Column(String(100))
    email= Column(String(100))
    company_name= Column(String(50))
    phoneNumber= Column(String(20))