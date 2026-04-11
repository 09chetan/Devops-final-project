# Use official Python image
FROM python:3.9-slim

# Create working directory
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create non-root user
RUN useradd --create-home appuser
USER appuser

# Expose port
EXPOSE 8080

# Run application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
