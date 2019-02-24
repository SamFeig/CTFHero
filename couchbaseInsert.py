import os
from couchbase.cluster import Cluster
from couchbase.cluster import PasswordAuthenticator
from couchbase.n1ql import N1QLQuery

cluster = Cluster('couchbase://localhost')
authenticator = PasswordAuthenticator('username', 'password')
cluster.authenticate(authenticator)

cb = cluster.open_bucket('bucket-name')

print("Connected to redis db")
ctfs = next(os.walk('./CTF-challenges'))[1]
print(ctfs)
for ctf in ctfs:
    challenges = next(os.walk('./CTF-challenges/' + ctf))[1]
    print(challenges)
    for chal in challenges:
        print("Inserting {} into database".format(os.getcwd() + '/CTF-challenges/' + ctf + "/" + chal))
        cb.upsert(ctf + chal,{chal:'chal'})
# OperationResult<RC=0x0, Key=u'u:king_arthur', CAS=0xb1da029b0000>

# cb.get().value
# {u'interests': [u'Holy Grail', u'African Swallows'], u'name': u'Arthur', u'email': u'kingarthur@couchbase.com'}

## The CREATE PRIMARY INDEX step is only needed the first time you run this script
cb.n1ql_query('CREATE PRIMARY INDEX ON bucket-name').execute()

#row_iter = cb.n1ql_query(N1QLQuery('SELECT name FROM bucket-name WHERE ' + '$1 IN inter', 'African Swallows'))
# for row in row_iter: print(row)
# {u'name': u'Arthur'}