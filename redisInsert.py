import redis
import os

r = redis.Redis(host='localhost', port=6379, db=0)
print("Connected to redis db")
ctfs = next(os.walk('./CTF-challenges'))[1]
print(ctfs)
for ctf in ctfs:
    challenges = next(os.walk('./CTF-challenges/' + ctf))[1]
    print(challenges)
    for chal in challenges:
        print("Inserting {} into database".format(os.getcwd() + '/CTF-challenges/' + ctf + "/" + chal))
        r.set(ctf + chal,os.getcwd() + '/CTF-challenges/' + ctf + "/" + chal)