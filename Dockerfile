FROM alpine:3.18.4

WORKDIR /app

RUN apk add --no-cache \
    curl=8.4.0-r0 \
    python3=3.11.6-r0

COPY requirements.txt ./
RUN curl -s -o get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    python -m pip install --no-cache-dir uwsgi==2.0.23 && \
    python -m pip install --no-cache-dir -r requirements.txt && \
    rm -f get-pip.py

COPY . .

EXPOSE 8080

USER nobody
CMD ["uwsgi", "--http", "0.0.0.0:8080", \
     "--plugins", "python3", \
     "--wsgi", "wsgi:myapp" ]