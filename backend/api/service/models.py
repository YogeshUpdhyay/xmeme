from mongoengine import Document
from mongoengine.fields import *
from api.service.helpers.logs import console_logger

class Meme(Document):
    # Meme collection schema
    name = StringField()
    caption = StringField()
    url = URLField()
    creation_date = DateTimeField()

    def to_dict(self):
        return {
            "id": str(self.id),
            "name": self.name,
            "caption": self.caption,
            "url": self.url
        }

    meta = {
        'ordering': ['-creation_date']
    }