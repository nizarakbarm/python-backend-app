#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail


/usr/local/bin/uwsgi --http 0.0.0.0:8080 \
    --plugins python3 \
    --wsgi wsgi:myapp

echo ""
echo "$@"