FROM python:3.11.6-alpine3.18
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8080
ENV FLASK_APP=myapp
USER nobody
CMD ["flask", "run", "--host", "0.0.0.0"]