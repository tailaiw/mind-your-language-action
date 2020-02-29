FROM python:3

COPY sentiment-analysis/sentiment.py /

ENTRYPOINT ["sentiment.py"]