FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN shiny_garbanzo create-db
RUN shiny_garbanzo populate-db
RUN shiny_garbanzo add-user -u admin -p admin
EXPOSE 5000
CMD ["shiny_garbanzo", "run"]
