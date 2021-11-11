#!/usr/bin/env bash
set -e


service nginx restart
gunicorn --bind 0.0.0.0:8080 webapp.wsgi
