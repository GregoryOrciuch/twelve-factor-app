FROM cgr.dev/chainguard/wolfi-base:latest

ARG version=3.13

WORKDIR /code

RUN apk add python-${version} py${version}-pip

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

EXPOSE 8080

CMD ["fastapi", "run", "app/main.py", "--port", "8080"]
