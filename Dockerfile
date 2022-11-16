FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1
# ENV SOURCE_URL "http://localhost:8081/?action=stream"
# ENV RELAY_PORT "54321"
ARG SOURCE_URL
ARG RELAY_PORT
ENV SOURCE_URL_ENV=${SOURCE_URL}
ENV RELAY_PORT_ENV=${RELAY_PORT}

COPY . /
RUN		pip3 install -r /requirements.txt
RUN echo ${RELAY_PORT} ${SOURCE_URL}

EXPOSE ${RELAY_PORT}
CMD ["sh", "-c", "python ./relay.py -p ${RELAY_PORT_ENV} ${SOURCE_URL_ENV}"]
