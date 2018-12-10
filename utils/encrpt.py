# -*- coding: utf-8 -*-

from Crypto.Cipher import AES
from binascii import b2a_hex, a2b_hex

class prpcrypt():
    '''
    通过密药对重要数据加密??
    '''
    def __init__(self):
        self.key = "okeqwnk2987#$%ql"
        self.mode = AES.MODE_CBC


    def encrypt(self,text):
        cryptor = AES.new(self.key,self.mode,b'0000000000000000')
        length = 16
        count = len(text)
        if count < length:
            add = (length-count)
            #\0 backspace
            text = text + ('\0' * add)
        elif count > length:
            add = (length-(count % length))
            text = text + ('\0' * add)
        self.ciphertext = cryptor.encrypt(text)
        return b2a_hex(self.ciphertext)

    def decrypt(self,text):
        cryptor = AES.new(self.key,self.mode,b'0000000000000000')
        plain_text = cryptor.decrypt(a2b_hex(text))
        return plain_text.rstrip(b'\0')

if __name__ == '__main__':
    pc = prpcrypt()
    e = pc.encrypt('haha')
    d = pc.decrypt(e)
    print(e,d)
    print(d)

