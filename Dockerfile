FROM python:3

COPY sentiment-analysis/sentiment.py /sentiment.py

ENTRYPOINT ["python3", "/sentiment.py"]