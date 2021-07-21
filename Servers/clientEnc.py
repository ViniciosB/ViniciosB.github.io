import rpyc
from constRPYC import *

class Client:

    conn_directory = rpyc.connect(DIR_SERVER, DIR_PORT)
    (address, port) = conn_directory.root.exposed_lookup("serverNamen")
    print (address, port)
    MODE_ENCRYPT = 1
    MODE_DECRYPT = 0
    conn_server = rpyc.connect(address, port)
    key = 5
    original = 'a ligeira raposa marrom saltou sobre o cachorro cansado'
    print('  Original:', original)
    ciphered = conn_server.root.exposed_enc(original, key, MODE_ENCRYPT)
    print('Encriptada:', ciphered)






