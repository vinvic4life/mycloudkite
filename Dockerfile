FROM python:3.7
ENV PYBASE /pybase
ENV PYTHONUSERBASE $PYBASE
ENV PATH $PYBASE/bin:$PATH
RUN pip install pipenv

WORKDIR /tmp
COPY Pipfile .
RUN pipenv lock
RUN PIP_USER=1 PIP_IGNORE_INSTALLED=1 pipenv install -d --system --ignore-pipfile

COPY . /app/mycloudkite
WORKDIR /app
EXPOSE 8080
CMD ["gunicorn", "-b 0.0.0.0:8080", "mycloudkite:app"]
