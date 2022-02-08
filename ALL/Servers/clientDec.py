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

    ciphered  = 'f qnljnwf wfutyf rfwwtr yfqztà ytgwj t hfhmtwwt hfsyfit'
    print('  Original:', ciphered )
    ori= conn_server.root.exposed_enc(ciphered , key, MODE_DECRYPT)
    print('Decriptada:', ori)