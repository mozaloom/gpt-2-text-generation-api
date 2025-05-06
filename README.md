# GPT-2 Text Generation API

A FastAPI web application that provides an API endpoint for text generation using OpenAI's GPT-2 model via Hugging Face's Transformers library.

## Project Structure

```
.
├── DockerFile        # Docker configuration for containerization
├── LICENSE           # Project license information
├── Makefile          # Automation commands for development workflow
├── README.md         # This documentation file
├── requirements.txt  # Python dependencies
└── webapp
    └── main.py       # FastAPI application code
```

## API Endpoints

The application exposes the following endpoints:

- `GET /`: Homepage with basic API information
- `POST /generate`: Text generation endpoint that accepts JSON with input text

### Example Request

```bash
curl -X POST "http://localhost:8000/generate" \
     -H "Content-Type: application/json" \
     -d '{"text": "Once upon a time"}'
```

## Setup and Installation

### Local Development

1. Clone the repository
2. Setup environment:
   ```bash
   # Create and activate virtual environment (optional)
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   
   # Install dependencies
   make install
   ```
3. Run the application:
   ```bash
   make local
   ```

### Docker Deployment

1. Build the Docker image:
   ```bash
   make build
   ```
2. Run the container:
   ```bash
   make run
   ```
3. Stop the container when done:
   ```bash
   make stop
   ```

## Development Commands

The Makefile provides several useful commands:

- `make install`: Installs required dependencies
- `make format`: Formats code using Black
- `make lint`: Lints code using Pylint
- `make test`: Runs tests with pytest
- `make all`: Runs install, lint, and test in sequence
- `make clean`: Removes the Docker image

## License

See the [LICENSE](LICENSE) file for details.