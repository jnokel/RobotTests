FROM robotframework/rfdocker:3.1.2
MAINTAINER Baris EKICI <baris.ekici@hepsiburada.com>
COPY . /app
WORKDIR /app
RUN pip install --upgrade \
                --no-cache-dir \
				robotframework \
                robotframework-requests==0.4.7 \
                RESTinstance==1.0.0b34
				
#ENTRYPOINT robot -d results Tests/ReportingAPI.robot
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
