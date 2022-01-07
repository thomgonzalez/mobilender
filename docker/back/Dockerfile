# Django
FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN mkdir /code/media
RUN mkdir /code/staticfiles

ADD requirements.txt /code/
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    postgresql-client
RUN apt-get install -f
RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# es_MX.UTF-8 UTF-8/es_MX.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales
ENV LANG es_MX.UTF-8
ENV LC_ALL es_MX.UTF-8

RUN pip install -r requirements.txt

COPY . /code/

# Set the timezone.
ENV TZ=America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE ${PORT}

ENTRYPOINT [ "/code/docker/back/docker-entrypoint.sh" ]

CMD ["runserver"]
