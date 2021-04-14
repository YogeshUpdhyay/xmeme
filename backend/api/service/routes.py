from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse
from api.service.serializers import *
from api.service.models import *
from api.service.helpers import responses
from mongoengine.errors import DoesNotExist
from typing import List
import datetime

router = APIRouter()

@router.get("",
    status_code=200,
    response_model=List[GetMemeResponse],
    responses={
        500: responses._500()
    })
async def get_memes():
    # Fetches the latest 100 memes
    try:
        memes = Meme.objects[0:100]
        response = list()
        for meme in memes:
            response.append(meme.to_dict())
        return JSONResponse(content=response, status_code=200)
    except Exception as e:
        console_logger.debug(e)
        raise HTTPException(status_code=500)

@router.get("/{id}",
    status_code=200,
    response_model=GetMemeResponse,
    responses={
        404: responses._404(),
    })
async def get_meme(id: str):
    # Fetches meme by id
    try:
        meme = Meme.objects.get(id = id)
        meme.creation_date = datetime.datetime.utcnow()
        response = meme.to_dict()
        return JSONResponse(content=response, status_code=200)
    except DoesNotExist:
        raise HTTPException(status_code=404)
    except Exception as e:
        console_logger.debug(e)
        raise HTTPException(status_code=500)

@router.post("",
    status_code=200,
    response_model=CreateMemePostReponse,
    responses={
        409: responses._409(),
        403: responses._403(),
        500: responses._500()
    }
)
async def create_post(payload: CreateMemePostPayload):
    # Create a new post 
    if payload.url.endswith(".jpg") or payload.url.endswith(".jpeg") or payload.url.endswith(".png"):
        pass
    else:
        raise HTTPException(status_code=403)

    if Meme.objects(url__icontains = payload.url):
        raise HTTPException(status_code=409)
    
    try:
        meme = Meme(**payload.dict())
        meme.save()
        response = CreateMemePostReponse(id = str(meme.id)).dict()
        return JSONResponse(content=response, status_code=200)
    except Exception as e:
        console_logger.debug(e)
        raise HTTPException(status_code=500)

@router.patch("/{id}",
    status_code=200,
    response_model=None,
    responses={
        404: responses._404(),
        500: responses._500()
    })
async def patch_meme(id: str, payload: UpdateMemePatchIn):
    # Update url or caption of the meme
    try:
        meme = Meme.objects.get(id = id)
    except DoesNotExist:
        raise HTTPException(status_code=404)
    except Exception as e:
        console_logger.debug(e)
        raise HTTPException(status_code=500)
    
    try:
        meme.update(**payload.dict(exclude_none=True))
        return JSONResponse(status_code=200)
    except Exception as e:
        console_logger.debug(e)
        raise HTTPException(status_code=500)
