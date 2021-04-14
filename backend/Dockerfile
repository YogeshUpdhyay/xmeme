FROM python:3.9-slim
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code
RUN pip install -r requirements.txt
ADD . /code/

# FROM gcr.io/distroless/python3-debian10
# COPY --from=build-env /usr/local/lib/python3.9/site-packages /usr/lib/python3.7/.
# COPY --from=build-env /code /code
# WORKDIR /code