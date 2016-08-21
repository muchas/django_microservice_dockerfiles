FROM kglod/python


RUN mkdir /gunicorn
ADD ./runner.sh /runner.sh
ADD ./gunicorn/run.py /gunicorn/run.py
ADD ./gunicorn/config.py /gunicorn/config.py
