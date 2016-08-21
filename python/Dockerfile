FROM python:3.5


ENV APP_DIR /code
ENV REQ_FILE requirements.txt
ENV PYTHON_BIN python3
ENV PIP_BIN pip3


RUN mkdir $APP_DIR
WORKDIR $APP_DIR

ADD ./entrypoint.sh /entrypoint.sh
ADD ./runner.sh /runner.sh

RUN pip install --upgrade pip


ENTRYPOINT ["/entrypoint.sh"]
CMD ["build_and_run"]
