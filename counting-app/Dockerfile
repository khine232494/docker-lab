# Copyright IBM Corp. 2018, 2023
# SPDX-License-Identifier: MPL-2.0

FROM alpine:3.24.2
WORKDIR /app
ADD . /app
EXPOSE 9001
ENV PORT 9001
CMD ["./counting-service"]


# FROM python:3.9-slim
# WORKDIR /app
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt
# COPY app.py .
# EXPOSE 9001
# CMD ["python", "app.py"]
