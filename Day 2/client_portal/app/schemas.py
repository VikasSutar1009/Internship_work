from pydantic import BaseModel

class ClientBase(BaseModel):
    name: str
    email: str
    company_name: str
    phoneNumber:str

class ClientResponse(ClientBase):
    client_id: int

    class Config:
        from_attributes= True
