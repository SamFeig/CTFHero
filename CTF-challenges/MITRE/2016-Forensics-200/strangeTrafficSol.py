from ftplib import FTP
ftp = FTP('localhost')
ftp.login('ftp', '')
print ftp.sendcmd('noop')
