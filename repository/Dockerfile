FROM fedora:latest

RUN yum install python3 python3-pip -y
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN mkdir -p /python_api
COPY python-api.py /python_api/
WORKDIR /python_api
CMD ["python3", "python-api.py"]