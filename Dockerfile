FROM python:3
ARG APPDIR
ENV APPDIR /home/app

ADD . $APPDIR

WORKDIR $APPDIR

RUN useradd -c 'app.js user' -m -d $APPDIR -s /bin/bash app
RUN pip install -r requirements.txt

USER app
ENV FLASK_APP $APPDIR/hello.py
CMD ["flask", "run", "--host=0.0.0.0"]
