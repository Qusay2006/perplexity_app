# هي مكتبات pydantic = parsing
#وBaseModel هوة كلاس جوا هلمكتبة
from pydantic import BaseModel

class ChatBody(BaseModel):
    #شو نوع البيانات الجاية من الflutter/dart
    query:str