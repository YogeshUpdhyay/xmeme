from typing import List
from pydantic import BaseModel


class DefaultResponseModel(BaseModel):
    detail: str

def _404(desc='Not Found', detail='Not Found') -> dict:
    return {
        'model': DefaultResponseModel,
        'description': desc,
        'content': {
            'application/json': {
                'example': {
                    'detail': detail
                }
            }
        }
    }


def _500(desc='Internal Server Error', detail='Internal Server Error') -> dict:
    return {
        'model': DefaultResponseModel,
        'description': desc,
        'content': {
            'application/json': {
                'example': {
                    'detail': detail
                }
            }
        }
    }


def _403(desc='Forbidden', detail='Forbidden') -> dict:
    return {
        'model': DefaultResponseModel,
        'description': desc,
        'content': {
            'application/json': {
                'example': {
                    'detail': detail
                }
            }
        }
    }

def _409() -> dict:
    return {
        'model': DefaultResponseModel,
        'description': 'Conflict',
        'content': {
            'application/json': {
                'example': {'detail': 'Conflict'}
            }
        }
    }