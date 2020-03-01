FROM python:3.6

COPY profanity-check/requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

COPY profanity-check/main.py /main.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]