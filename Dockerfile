FROM python:3.6

USER root

RUN apt-get update
RUN apt-get install -y curl jq

COPY profanity-check/requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

COPY profanity-check/check.py /check.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]