FROM python:3.11-slim

# Install system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project
WORKDIR /app
COPY . /app

# Install Python packages
RUN pip install --no-cache-dir voila numpy pandas matplotlib scikit-learn joblib

# Expose Voilà server
EXPOSE 7860

# Start Voilà
CMD ["voila", "--port=7860", "--no-browser", "--strip_sources=False", "notebooks/iris_explorer.ipynb"]