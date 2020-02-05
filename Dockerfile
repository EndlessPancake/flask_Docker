FROM python:3-alpine
MAINTAINER endless pancake4u <endless.pnacake4u@gmail.com> 

ARG BUILD_DATE
ARG VCS_REF

# Set labels (see https://microbadger.com/labels)
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/EndlessPancake/python3-alpine-flask-docker"

# set for *.html
ENV IMG_FILE_NAME=2office365

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app
COPY static/ /usr/src/app

# Expose the Flask port
EXPOSE 8888

# CMD [ "python", "main.py", $IMG_FILE_NAME ]
CMD python main.py $IMG_FILE_NAME
