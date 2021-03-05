FROM python:3-slim

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/engines
RUN git clone https://git.sr.ht/~metalune/simplytranslate_engines /usr/src/app/engines
RUN python3 setup.py install

WORKDIR /usr/src/app/web
RUN git clone https://git.sr.ht/~metalune/simplytranslate_web /usr/src/app/web
RUN pip install -r requirements.txt

RUN pip install uvicorn

EXPOSE 5000

ENTRYPOINT ["uvicorn", "main:app"]
CMD ["--port", "5000", "--host", "0.0.0.0"]
