FROM python:2.7-onbuild

COPY good.sh .
COPY bad.sh .
COPY mogui.py .
COPY ticker.sh .

CMD [ "python", "./mogui.py" ]

EXPOSE 80