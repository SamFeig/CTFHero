import string
import subprocess

base = 'a'*20
baseArr = list(base)

for char in string.letters + string.digits + string.punctuation:
    testCase = baseArr[:]
    testCase[19] = char
    testCaseStr = ''.join(testCase)

    process = subprocess.Popen(['nc', 'localhost', '1337'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    process.stdin.write(testCaseStr + '\n')
    res = process.stdout.readline()
    if 'Sucess' in res:
        print "Key is %s" % testCaseStr
        break
