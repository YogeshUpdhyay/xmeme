from typing import List, Optional
from fastapi import FastAPI
from pydantic import *
import datetime

class CreateMemePostPayload(BaseModel):
    # Create New Meme Request Body
    name: str
    caption: str
    url: HttpUrl

class CreateMemePostReponse(BaseModel):
    # Create New Meme Response Body
    id: str

class GetMemeResponse(BaseModel):
    # Get Meme Response Body
    id: str
    name: str
    caption: str
    url: str

class UpdateMemePatchIn(BaseModel):
    # Update Meme Request Body
    caption: str
    url: str