# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Final stage (for smaller image size)
# FROM base as final
# COPY --from=base /app /app
# CMD ["gunicorn", "dockerDjango.wsgi:application", "--bind", "0.0.0.0:8000"]