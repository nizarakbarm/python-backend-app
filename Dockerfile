FROM python:3.11.6-alpine3.18
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8080
ENV FLASK_APP=web.python
USER nobody
CMD ["flask", "run", "--host", "0.0.0.0"]