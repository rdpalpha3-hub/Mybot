# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install system dependencies (including Git)
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Expose Port 80 for Back4App
EXPOSE 80

# Run main.py when the container launches
CMD ["python3", "main.py"]
