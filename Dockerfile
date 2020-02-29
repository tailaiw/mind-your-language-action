FROM python:3

COPY entrypoint.sh /entrypoint.sh
COPY sentiment-analysis/sentiment.py /sentiment.py

ENTRYPOINT ["/entrypoint.sh"]