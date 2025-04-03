# Import necessary libraries
from transformers import pipeline  # Hugging Face pipeline for easy model access
from fastapi import FastAPI, Response  # FastAPI framework and Response for HTTP responses
from pydantic import BaseModel  # Pydantic for request body validation

# Load the GPT-2 text generation model using the Hugging Face pipeline
generator = pipeline('text-generation', model='gpt2')

# Initialize a FastAPI app
app = FastAPI()

# Define a request body model for the API using Pydantic
class Body(BaseModel):
    text: str  # The input text that will be used for text generation

# Define the root endpoint (Homepage)
@app.get('/')
def root():
    """
    Root endpoint that returns a simple HTML response.
    It serves as a homepage with a brief description of the API.
    """
    return Response("<h1>A self-documenting API to interact with a GPT2 model and generate text<h1>")

# Define an endpoint for text generation
@app.post('/generate')
def predict(body: Body):
    """
    Endpoint to generate text using GPT-2.
    
    Args:
        body (Body): A request body containing input text.

    Returns:
        dict: A dictionary containing the generated text.
    """
    # Generate text based on input using GPT-2
    results = generator(body.text, max_length=35, num_return_sequences=1)

    # Return the generated text in a structured JSON response
    return {'generated_text': results[0]['generated_text'].strip()}
