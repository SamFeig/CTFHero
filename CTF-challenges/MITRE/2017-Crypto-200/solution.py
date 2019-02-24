# cmd> pip install pycryptodome
# This script was tested under Ubuntu 16.04LTS and confirmed to work.
# The resultant file "output.exe" will run appropriately under WINE.

from Crypto.Cipher import AES

def main():
    with open("./_2._", "rb") as f:
        data = f.read()
        aes = AES.new(key=b"\xde\xc0\xde\xc0\xff\xee\xfe\xed\xde\xc0\xde\xc0\xff\xee\xfe\xed", mode=AES.MODE_CBC, IV=b"\x00\x11\x22\x33\x44\x55\x66\x77\x88\x99\xaa\xbb\xcc\xdd\xee\xff")
        plain_text = aes.decrypt(data)
        with open("./output.exe", "wb+") as f2:
            f2.write(plain_text)

if __name__ == "__main__":
    main()
