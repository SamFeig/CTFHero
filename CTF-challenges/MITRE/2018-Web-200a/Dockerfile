FROM centos

ARG flag
ARG adminPassword

RUN yum -y install epel-release
RUN yum -y install python34-pip npm
RUN pip3 install virtualenv

RUN useradd -m -s /bin/bash ctf
USER ctf
WORKDIR /home/ctf

RUN virtualenv env --python=python3
ENV PATH ~/env/bin:/bin:/usr/bin

COPY --chown=ctf . .

RUN pip3 install -r requirements.txt
RUN npm install
RUN npm run build

ENV FLASK_APP autoapp.py
ENV LC_ALL en_US.utf-8
env LANG en_US.utf-8

RUN flask db init
RUN flask db migrate
RUN flask db upgrade

RUN flask create_admin -p "${adminPassword}"
RUN flask add_userdata -u admin -d "${flag}"

CMD gunicorn myflaskapp.app:create_app\(\) -b 0.0.0.0:8080 -w 4 
EXPOSE 8080
