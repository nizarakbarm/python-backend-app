#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


/usr/bin/uwsgi --http 0.0.0.0:8080 --plugins python3 --wsgi wsgi:myapp

echo ""
echo "$@"