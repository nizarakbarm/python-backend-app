FROM alpine:3.18.4

WORKDIR /app

RUN apk add --no-cache \
    uwsgi-python3=2.0.21-r3	 \
    python3=3.11.6-r0

RUN python -m ensurepip --upgrade

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

USER nobody
CMD ["uwsgi", "--http", "0.0.0.0:8080", \
     "--plugins", "python3", \
     "--wsgi", "wsgi:app" ]