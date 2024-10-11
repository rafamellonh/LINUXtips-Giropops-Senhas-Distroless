FROM cgr.dev/chainguard/python:latest-dev AS buildando

WORKDIR /app
COPY --chown=nonroot:nonroot . .
#RUN chown -R nonroot:nonroot /app

USER nonroot

RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"


RUN pip install --no-cache-dir -r /app/requirements.txt

RUN cp /bin/bash /app/bash

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

COPY --from=buildando /app/bash /bin/bash
COPY --from=buildando /app/ .

COPY app.py app.py
COPY --from=buildando /app/venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
ENV FLASK_APP=app.py

EXPOSE 5000

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]


