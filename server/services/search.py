#هاد اللي بقوم بلبحث بسورس ليجبلنا الاجوبة(الموقع)
from ddgs import DDGS
#بتستخرجلك النصوص المهمة من صفحات الويب
import trafilatura


class SearchService:
    def web_search(self, query:str):
        results = []
        with DDGS() as ddgs:
            search_results = ddgs.text(query, max_results=3)

        for result in search_results:
            url = result.get("href", "")
           #يرسل طلب HTTP لزيارة الرابط وتنزيل هيكل الـ HTML الخام الخاص بالصفحة
            donwloaded = trafilatura.fetch_url(url) if url else None
            #الدالة الأساسية لتحليل هيكل الـ HTML واستخراج المتن يعني النص الاساسي  للخبر أو المقال
            content = trafilatura.extract(donwloaded,include_comments=False) if donwloaded else None
            results.append({
            'title':result.get("title",""),
            "url":url,
            "content": content or result.get("body", ""),
            'score':0.0
            })
        return results