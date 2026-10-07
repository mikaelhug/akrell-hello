FROM python:3.13-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY manage.py .
COPY hello hello
ARG VERSION=dev
ENV APP_VERSION=$VERSION
RUN useradd --uid 10001 --no-create-home app
USER 10001
EXPOSE 8000
CMD ["sh", "-c", "python manage.py migrate --noinput && exec gunicorn hello.wsgi -b 0.0.0.0:8000 -w 2 --access-logfile -"]
