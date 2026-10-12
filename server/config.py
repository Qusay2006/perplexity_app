from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()

class Settings(BaseSettings):
    GEMINI_API_KEY: str = ""
# إنشاء كائن الإعدادات لاستخدامه في باقي المشروع
settings = Settings()