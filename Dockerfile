FROM python:3.6

COPY entrypoint.sh /entrypoint.sh
COPY profanity-check/main.py /main.py
COPY profanity-check/requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt

ENTRYPOINT ["/entrypoint.sh"]