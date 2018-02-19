FROM python:3
WORKDIR /home/app

RUN useradd -c 'app.js user' -m -d /home/app -s /bin/bash app
RUN pip install --no-cache-dir flask

ADD hello.py /home/app
USER app
ENV FLASK_APP /home/app/hello.py
CMD ["flask", "run", "--host=0.0.0.0"]
