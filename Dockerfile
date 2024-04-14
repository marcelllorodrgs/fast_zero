FROM python:3.11-slim
ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy project files
COPY . .

# Set the Python version to 3.11.7 explicitly
RUN poetry env use 3.11.7

# Configure Poetry
RUN poetry config installer.max-workers 10

# Install project dependencies
RUN poetry install --no-interaction --no-ansi

# Expose port and define command to run the server
EXPOSE 8000
CMD ["poetry", "run", "uvicorn", "--host", "0.0.0.0", "fast_zero.app:app"]
