from google import genai
from config import Settings

settings = Settings()


class LLMService:
    def __init__(self):
        self.client = genai.Client(api_key=settings.GEMINI_API_KEY)

    def generate_service(self, query: str, search_result: list[dict]):
       try:
        context_text = "\n\n".join([
            f"Source {i + 1} ({result.get('url')}):\n{result.get('content')}"
            for i, result in enumerate(search_result)
        ])

        full_prompt = f"""
        Context from web search :
        {context_text}

        Query:{query}

        Please provide a comprehensive, detailed, well-cited accurate response using the above context. Think and reason deeply . Ensure the user query the user is asking . Do not use your knowledge until it is necessary   
        """
        for chunk in self.client.models.generate_content_stream(
           model="gemini-3.5-flash-lite",
            contents=full_prompt,
        ):
         if chunk.text:
             yield chunk.text
       except Exception as e :
          print(type(e).__name__,e)