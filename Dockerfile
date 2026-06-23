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
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Expose the port your backend runs on (change 8000 to your actual port if needed)
EXPOSE 8000

# Run main.py when the container launches
CMD ["python", "main.py"]

