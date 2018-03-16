FROM python:3
ARG APPDIR
ENV APPDIR /home/app

ADD app/ $APPDIR

WORKDIR $APPDIR

RUN useradd -c 'app user' -m -d $APPDIR -s /bin/bash app
RUN pip install -r app/requirements.txt

USER app
ENV FLASK_APP $APPDIR/hello.py
CMD ["flask", "run", "--host=0.0.0.0"]
