

#مكتبة مخصصة لتحويل الجمل والكلمات إلى متجهات رياضية
from sentence_transformers import SentenceTransformer
import numpy as np


class SortService:
    def __init__(self):
        self.model = SentenceTransformer("all-MiniLM-L6-v2")

    def sort_service(self, query: str, search_result: list[dict]):
        lastResult = []

        query_embedding = self.model.encode(query)

        for res in search_result:
            res_embedding = self.model.encode(res['content'])

            similarity = float(np.dot(query_embedding, res_embedding) / (
                    np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding)
            ))

            res['score'] = float(similarity)

            if similarity > 0.2:
                lastResult.append(res)

         #طريقة لإنشاء دالة سريعة ومجهولة (بدون اسم) في سطر واحد دون الحاجة : lambbda
        return sorted(lastResult, key=lambda x: x['score'], reverse=True)