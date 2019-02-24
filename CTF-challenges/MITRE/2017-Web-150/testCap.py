import urllib

qid = -1
baseurl = 'http://localhost:80/captcha/validate?qid='
answ = '-----------------------------------------------------'
resp = ''
flag = ['&cb0=1', '&cb1=1', '&cb2=1', '&cb3=1', '&cb4=1', '&cb5=1']
while True:
    qid += 1


    url = baseurl + qid.__str__()
    con = urllib.urlopen(url)

    if con.geturl() != 'http://localhost:4567/home':
        resp = con.read()
        print(resp)

        flags = ''
        for i in range(16):
            if i % 2:
                flags += flag[0]
            if (i / 2) % 2:
                flags += flag[1]
            if (i / 4) % 2:
                flags += flag[2]
            if (i / 8) % 2:
                flags += flag[3]
            con = urllib.urlopen(url+flags)
            flags = ''
            resp = con.read()
            if resp == '<h1>Here is your flag: Incorrect</h1>':
                print(resp[23:])
            else:
                for pos in range(answ.__len__()):
                    if resp[pos + 23] != '-':
                        answ = answ[:pos] + resp[pos + 23] + answ[pos+1:]
                print(answ)
                print(resp)
                break
        if not answ.__contains__('-'):
            break
    else:
        print('ERROR')
        break
