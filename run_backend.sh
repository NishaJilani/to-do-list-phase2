#!/bin/bash
echo "Initializing database..."
cd backend
python -c "from app.init_db import init_db; init_db()"
echo "Starting FastAPI server..."
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000