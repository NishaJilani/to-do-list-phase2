# Full Stack Todo Application

A complete full-stack todo application built with Next.js (frontend) and FastAPI (backend) with authentication and user-specific tasks.

## Features

- User registration and authentication
- Secure JWT-based authentication
- Create, read, update, and delete tasks
- User-specific task management (users can only see/edit their own tasks)
- Responsive UI built with Tailwind CSS
- SQLite database for data persistence

## Tech Stack

- **Frontend**: Next.js 14 with TypeScript
- **Backend**: FastAPI with Python
- **Database**: SQLite (can be configured for PostgreSQL/Neon)
- **Authentication**: JWT tokens with bcrypt password hashing
- **Styling**: Tailwind CSS

## Prerequisites

- Python 3.8+
- Node.js 18+
- pip (Python package manager)

## Setup Instructions

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Create a `.env` file in the root directory with the following content:
   ```
   SECRET_KEY=your-super-secret-key-change-this-in-production
   DATABASE_URL=sqlite:///./todo.db
   ALGORITHM=HS256
   ACCESS_TOKEN_EXPIRE_MINUTES=30
   ```

4. Run the backend server:
   ```bash
   # Option 1: Using the batch script (Windows)
   ./run_backend.bat

   # Option 2: Manual start
   python -c "from app.init_db import init_db; init_db()"  # Initialize database
   uvicorn app.main:app --reload --host 0.0.0.0 --port 8000  # Start server
   ```

The backend will be available at `http://localhost:8000`.

### Frontend Setup

1. Install Node.js dependencies:
   ```bash
   npm install
   ```

2. Create a `.env.local` file in the root directory with the following content:
   ```
   NEXT_PUBLIC_API_URL=http://localhost:8000
   ```

3. Run the development server:
   ```bash
   npm run dev
   ```

The frontend will be available at `http://localhost:3000`.

## API Endpoints

### Authentication
- `POST /api/v1/register` - Register a new user
- `POST /api/v1/login` - Login and get JWT token

### Tasks
- `GET /api/v1/tasks` - Get all tasks for the authenticated user
- `POST /api/v1/tasks` - Create a new task
- `GET /api/v1/tasks/{task_id}` - Get a specific task
- `PUT /api/v1/tasks/{task_id}` - Update a specific task
- `DELETE /api/v1/tasks/{task_id}` - Delete a specific task

## Environment Variables

### Backend (.env)
- `SECRET_KEY`: Secret key for JWT token signing
- `DATABASE_URL`: Database connection string (defaults to SQLite)
- `ALGORITHM`: JWT algorithm (default: HS256)
- `ACCESS_TOKEN_EXPIRE_MINUTES`: Token expiration time (default: 30)

### Frontend (.env.local)
- `NEXT_PUBLIC_API_URL`: Backend API URL (default: http://localhost:8000)

## Security Features

- Passwords are hashed using bcrypt
- JWT tokens for authentication
- Users can only access their own tasks
- Proper error handling and validation
- SQL injection prevention through SQLAlchemy ORM

## Running in Production

For production deployment, make sure to:
1. Use a production-ready database (PostgreSQL recommended)
2. Set a strong secret key
3. Configure proper CORS settings
4. Use HTTPS for secure communication
5. Set up a reverse proxy (nginx/Apache)

## Project Structure

```
├── backend/
│   ├── app/
│   │   ├── api/          # API route handlers
│   │   ├── auth/         # Authentication utilities
│   │   ├── models/       # Database models
│   │   ├── schemas/      # Pydantic schemas
│   │   ├── database.py   # Database setup
│   │   └── main.py       # Main FastAPI app
│   ├── requirements.txt
│   └── run_backend.bat
├── app/                  # Next.js app directory
├── components/           # React components
├── lib/                  # Utility functions
└── ...
```

## Troubleshooting

1. If you get database errors, make sure the SQLite file has proper permissions
2. If authentication fails, verify your SECRET_KEY is consistent between restarts
3. If the frontend can't connect to the backend, check that both are running and the API URL is correct