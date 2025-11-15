FROM python:3.11-slim

# Install updates
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir voila jupyter ipykernel numpy pandas scikit-learn matplotlib

# Expose port
EXPOSE 7860

# Start Voila on HuggingFace
CMD ["voila", "iris_explorer.ipynb", \
     "--port=7860", \
     "--no-browser", \
     "--ip=0.0.0.0", \
     "--strip_sources=False"]