from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import mongoengine

def dbinit():
    mongoengine.connect(db="XmemeDB", host="mongo", username='root', password='example', authentication_source='admin')

def create_app():
    app = FastAPI(
        title="Xmeme",
        description="Join the meme wave",
        version="1.0.0",
        openapi_url="/swagger-ui/openapi.json",
        docs_url="/swagger-ui",
    )
    dbinit()
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    from .service.routes import router as service_router
    app.include_router(service_router, prefix="/memes")
    return app

app = create_app()