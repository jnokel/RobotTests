FROM robotframework/rfdocker:3.1.2
COPY . /app
WORKDIR /app
RUN pip install --upgrade \
                --no-cache-dir \
		robotframework-requests==0.4.7 \
                RESTinstance==1.0.0b34 \
                robotframework-seleniumlibrary
		#RESTinstance
		
ENTRYPOINT robot -d results Tests/ReportingAPI.robot

#commit for demo

# Copies your code file from your action repository to the filesystem path `/` of the container
#COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
#ENTRYPOINT ["/entrypoint.sh"]
