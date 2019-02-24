import redis
import os

r = redis.Redis(host='localhost', port=6379, db=0)
print("Connected to redis db")
challenges = [x[0] for x in os.walk('./CTF-challenges')]
for chal in challenges:
    print("Inserting {} into database".format(chal))
    r.set(chal[2:],os.getcwd() + '/CTF-challenges' + chal[1:])