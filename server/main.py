from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from pydantic_models.chat_model import ChatBody
from services.sort_service import SortService
from services.llm_service import LLMService
from services.search import SearchService

app = FastAPI()
search= SearchService()
llmService = LLMService()
sortService = SortService()

@app.websocket("/ws/chat")
async def websocket_endpoint(websocket: WebSocket):
     await websocket.accept()
     try:
        # هي البيانات الجاية من المستخدم
        data = await websocket.receive_json()
        print("RECEIVED:", data)   
        # هون عم نستخرج نص السؤال
        query = data.get("query")

        result = search.web_search(query)
        
        sortedResult= sortService.sort_service(query , result)

        await websocket.send_json({
             'type' : 'search_result',
             'data' : sortedResult
        })
        for chunk in llmService.generate_service(query , sortedResult):

           await websocket.send_json({
             'type': 'content',
             'data': chunk
        })

     except WebSocketDisconnect:
          print('Print disconnected')
     except Exception as e:
          print("Error", repr(e))     
     finally:
          try:
               await websocket.close()
          except Exception:
               pass


#يرسل الطلب للمسار chat/
@app.post("/chat")
#يقوم ال fastapi بارسال الdata الى ال chatBody بيفحصا وبيتاكد من الشرط تبعا بعدا بيبعت ال data علfunction المذكورة
def chat_endpoint(body : ChatBody):
     result = search.web_search(body.query)
     sortedResult= sortService.sort_service(body.query , result)

     return llmService.generate_service(body.query , sortedResult)
