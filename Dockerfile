FROM python3
ENV PYBASE /pybase
ENV PYTHONUSERBASE $PYBASE
ENV PATH $PYBASE/bin:$PATH
RUN pip install pipenv

WORKDIR /tmp
COPY Pipfile .
RUN pipenv lock
RUN PIP_USER=1 PIP_IGNORE_INSTALLED=1 pipenv install -d --system --ignore-pipfile

COPY . /app/mycloudkite
WORKDIR /app/mycloudkite
EXPOSE 8080
CMD ["flask", "run", "--host=0.0.0.0"]
