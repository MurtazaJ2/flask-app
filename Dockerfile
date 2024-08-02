FROM python:3.8-slim-buster
COPY . /app
RUN pip install -r requirements.txt
copy . .
CMD ["python", "app.py"]