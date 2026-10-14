# 🔍 Perplexity App

An AI search app inspired by Perplexity. Ask a question and the app searches the web, finds the most relevant pages, and streams an answer based on them.

Built to learn **RAG** (Retrieval-Augmented Generation) with **Flutter**, **FastAPI**, and **WebSockets**.

## 📷 Screenshots

### 🏠 Home Page
<p align="center">
  <img width="220" alt="Home 1" src="https://github.com/user-attachments/assets/2c94278f-e4b3-4685-8cea-57d21eb5da4a" />
  <img width="220" alt="Home 2" src="https://github.com/user-attachments/assets/63439d54-908e-407f-9a87-4e8e7f691e34" />
</p>

---

### ⏳ Loading State
<p align="center">
  <img width="220" alt="Loading" src="https://github.com/user-attachments/assets/d034111d-a849-4ce4-805a-7befd34dc2e8" />
</p>

---

### 💡 Answer View
<p align="center">
  <img width="220" alt="Answer 1" src="https://github.com/user-attachments/assets/dd01a9c8-434f-4f47-94a8-f98b46bfd25f" />
  <img width="220" alt="Answer 2" src="https://github.com/user-attachments/assets/399e8c37-95c6-46e7-baf3-e65964b08544" />
</p>
|---|---|---|


## 🧠 What is RAG?

A language model only knows what it saw in training, so it can be out of date or make things up. **RAG** fixes this: the app first looks up real information, then asks the model to answer from it. Like an open-book exam.

```
Question → Search the web → Rank by meaning → Gemini answers from the sources
            (Retrieve)         (Rank)              (Augment + Generate)
```

To rank pages, the app turns the question and each page into **embeddings** (text as numbers) and keeps only the ones closest in meaning.

## ✨ Features

- Web search for every question, with no search API key needed
- Semantic ranking of sources with embeddings
- AI answer from Gemini, built from the sources it found
- Answer streamed in real time and rendered as Markdown
- Source cards above the answer, with skeleton loading

## 🏗️ Architecture

```
Flutter App  ⇄  WebSocket  ⇄  FastAPI Server
```

The server sends the ranked sources first (`search_result`), then the answer in small chunks (`content`). The app updates the screen as each message arrives.

## 🧰 Tech Stack

**App:** `get_it` + `injectable` · `web_socket_client` · `flutter_markdown_plus` · `skeletonizer`

**Server:** `FastAPI` · `ddgs` · `trafilatura` · `sentence-transformers` · Gemini API

## 🚀 Getting Started

**Server**

```bash
git clone https://github.com/Qusay2006/perplexity_app.git
cd perplexity_app/server
python -m venv venv
venv\Scripts\activate
pip install "fastapi[standard]" ddgs trafilatura sentence-transformers google-genai pydantic-settings python-dotenv
```

Create a `.env` file inside `server` with a free key from [Google AI Studio](https://aistudio.google.com/app/apikey):

```
GEMINI_API_KEY=your_key_here
```

```bash
fastapi dev main.py
```

**App** (from the project root)

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

> On the Android emulator, change `localhost` to `10.0.2.2` in `lib/data/chat_web_service.dart`.

## 👤 Author

**Qusai Meshow** · [LinkedIn](https://www.linkedin.com/in/qusay-masho-88b6a143b)
